# dbt-demo-bq
Create a sample project using dbt and big query

## Get started

### install env
install poetry using poetry init in project root

```poetry add dbt-core dbt-bigquery```


### setup dbt

#### prerequisite
create a service account with a key in json file from a google project and save it in the dbt project root after creation. Remember to gitignore the file so that it key is not exposed.   

```dbt init dbt_bq```

follow the process and provide necessary details. 

cd to dbt_bq

run test connection

```dbt debug```

It will generate a .dbt/profiles.ymal in the process which located in you local computer that helps you setup the connection with bigquery. In a production enviroment if you have multiple enviroment, you can specify in profiles

###

Change your sql script and models. 

run 

```dbt run```

### Test and generate docs
To run data quality test, you can specify what to test in schema.yml
```dbt test```

```dbt docs generate```

```dbt docs serve```


