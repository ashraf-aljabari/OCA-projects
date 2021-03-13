from django.urls import path

from .views import SignUpView, index, LoginView, dataset, viewdatasource, deleteDataSource, viewDataSet, editDataSource, \
    updateDataSource, viewCharts


urlpatterns = [
    path('/accounts/login/', LoginView.as_view(), name='login'),
    path('signup/', SignUpView.as_view(), name='signup'),
    path('adddatasource/', index, name="home"),
    path('dataset/', dataset, name="dataset"),
    path('', viewdatasource, name='viewdatasource'),
    path('editdatasource/<id>', editDataSource, name='editdatasource'),
    path('viewdataset/<id>', viewDataSet, name='viewdataset'),
    path('deletedatasource/<id>', deleteDataSource, name='deletedatasource'),
    path('updateDataSource/', updateDataSource, name='updateDataSource'),
    path('charts/<id>', viewCharts, name='charts'),

]

