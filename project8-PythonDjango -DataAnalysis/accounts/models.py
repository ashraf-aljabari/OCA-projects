from django.db import models
from django.contrib.auth.models import User


class DataSource(models.Model):
    name = models.TextField()
    user = models.ForeignKey(User, on_delete=models.CASCADE)


class DataSet(models.Model):
    Country = models.CharField(max_length=20)
    Confirmed = models.BigIntegerField(max_length=10)
    Deaths = models.BigIntegerField(max_length=10)
    Recovered = models.BigIntegerField(max_length=10)
    Active = models.BigIntegerField(max_length=10)
    New_cases = models.BigIntegerField(max_length=10)
    New_deaths = models.BigIntegerField(max_length=10)
    New_recovered = models.BigIntegerField(max_length=10)
    Deaths_percentage = models.BigIntegerField(max_length=10)
    Recovered_percentage = models.BigIntegerField(max_length=10)
    Region = models.CharField(max_length=10)
    source = models.ForeignKey(DataSource, on_delete=models.CASCADE)

