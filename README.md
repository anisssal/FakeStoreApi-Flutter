# Store App
This app using https://fakestoreapi.com/.

In this project we define several folder for separating concern;  data , domain , presentation.
<br /><br />
- Domain => The domain layers is the deepest layer, the domain layer contain only the core of business object => entities and repository contract => usecase. This layer should not be change when we change our datasource or the UI. Domain layer should be totally independent of other layers.
  <br /><br />
- Presentation => on this layer we have our page and widgets who can dispatch an event to the bloc as state management for getting data from repository
  <br /><br />
- Data =>  the data layer/folder consists of data sources and Repository implementation for the contract that defined on the Domain layer. In this layer we fetch data from some api provider, services, caching data or fetch cached data from local-storage.

we also use get_it package as a service locator creating singleton and object instance
<br />

## Prerequisites

* Flutter SDK Version : 3.19.6 [Get SDK](https://docs.flutter.dev/development/tools/sdk/releases)
* Dart SDK Version : 3.3.4


## Try to install release app using app-release.apk file

## Step By Step Run This Project
* ##### Clone the project

* ##### Checkout the root folder

* ##### create .env.development from .env.example
```
cp .env.example .env.development
```

* #####  Restore the packages

```
flutter pub get
```

* ##### Run
```
flutter run
```


* ##### Use credential from https://fakestoreapi.com/users to login; example :
```
username : johnd
password : m38rmF$
```

## Todo
* [ ] Code coverage to 100%
* [ ] Integration testing 
