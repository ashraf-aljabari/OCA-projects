from django.contrib.auth.forms import UserCreationForm
from django.urls import reverse_lazy
from django.views import generic
from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from .models import DataSet, DataSource
from accounts.resources import DataResource
import tablib

import os


class SignUpView(generic.CreateView):
    form_class = UserCreationForm
    success_url = reverse_lazy('login')
    template_name = 'registration/signup.html'


class LoginView(generic.CreateView):
    success_url = reverse_lazy('/')


@login_required(login_url='/accounts/login')
def index(request):
    """
    TODO Get The Session Key For Each User
    """
    current_user = request.user
    print(current_user.id)

    if request.method == 'POST':
        if request.POST['name']:
            data_sor = DataSource(name=request.POST['name'], user_id=current_user.id)
            data_sor.save()
            return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    # if request.user.is_authenticated:
    return render(request, "home.html")


def csvFile(file, option):
    resources = DataResource()
    dataset = tablib.Dataset()
    imported_data = dataset.load(file.read(), 'csv')
    result = resources.import_data(dataset, dry_run=False)
    DataSet.objects.filter(source_id__isnull=True).update(source_id=option)


def xlsxFile(file, option):
    resources = DataResource()
    dataset = tablib.Dataset()
    imported_data = dataset.load(file.read(), format='xlsx')
    result = resources.import_data(dataset, dry_run=False)
    DataSet.objects.filter(source_id__isnull=True).update(source_id=option)


@login_required(login_url='/accounts/login')
def dataset(request):
    error = ''
    current_user = request.user
    query = 'SELECT * FROM accounts_datasource WHERE user_id = ' + str(current_user.id)
    datasorce = DataSource.objects.raw(query)
    data = DataSet()
    if request.method == 'POST':
        from io import TextIOWrapper

        excel_file = TextIOWrapper(request.FILES['file'].file, encoding=request.encoding)

        option = request.POST['option']

        if request.FILES['file'].name.split('.')[1] == 'xlsx':
            xlsxFile(request.FILES['file'].file, option)
        elif request.FILES['file'].name.split('.')[1] == 'csv':
            csvFile(excel_file, option)
        else:
            error = "Invalid input file, please make sure to put either .CSV or .XLSX files."

    return render(request, 'dataset.html', {'datasource': datasorce, 'error': error})


def viewdatasource(request):
    current_user = request.user
    query = 'SELECT * FROM accounts_datasource WHERE user_id = ' + str(current_user.id)
    datasorce = DataSource.objects.raw(query)
    return render(request, 'viewdatasorce.html', {'datasorce': datasorce})


def deleteDataSource(request, id):
    DataSource.objects.filter(id=id).delete()
    return redirect('/')


def editDataSource(request, id):
    datasource = DataSource.objects.get(id=id)
    return render(request, 'editdatasource.html', {'datasource': datasource})


def updateDataSource(request):
    if request.method == "POST":
        DataSource.objects.filter(id=request.POST['id']).update(name=request.POST['name'])
        return redirect('/')


def viewDataSet(request, id):
    query = 'SELECT * FROM accounts_dataset WHERE source_id = ' + str(id)
    dataSet = DataSet.objects.raw(query)
    return render(request, 'viewdataset.html', {'dataSet': dataSet})




def viewCharts(request, id):
    query = 'SELECT * FROM accounts_dataset WHERE source_id = ' + str(id)
    dataSet = DataSet.objects.raw(query)

    return render(request, 'charts.html', {'dataSet': dataSet})

