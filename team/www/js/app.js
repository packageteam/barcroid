// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
// 'starter.controllers' is found in controllers.js
angular.module('starter', ['ionic', 'starter.controllers'])

.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    // for form inputs)
    if (window.cordova && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
      cordova.plugins.Keyboard.disableScroll(true);

    }
    if (window.StatusBar) {
      // org.apache.cordova.statusbar required
      StatusBar.styleDefault();
    }
  });
})

.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider

  .state('app.create_new_transaction', {
      url: '/create_new_transaction',
      views: {
        'menuContent': {
          templateUrl: 'templates/nikki/create_new_trans.html',
          controller: 'viewitem'
        }
      }
    })

  .state('app.edit_new_transaction', {
      url: '/edit_new_transaction',
      views: {
        'menuContent': {
          templateUrl: 'templates/nikki/edit_new_transaction.html',
          controller: 'edititem'
        }
      }
    })

  .state('app.search_scan', {
      url: '/search_scan',
      views: {
        'menuContent': {
          templateUrl: 'templates/nikki/search_scan.html',
          controller: 'ProfileCtrl'
        }
      }
    })

  .state('app.search_item', {
      url: '/search_item',
      views: {
        'menuContent': {
          templateUrl: 'templates/nikki/search_item.html',
          controller: 'AddItemTransaction'
        }
      }
    })

  .state('app.submit_transaction', {
      url: '/submit_transaction',
      views: {
        'menuContent': {
          templateUrl: 'templates/nikki/submit_transaction.html',
          controller: 'ProfileCtrl'
        }
      }
    })

  .state('app.todolist', {
      url: '/todolist',
      views: {
        'menuContent': {
          templateUrl: 'templates/nikki/todolist.html',
          controller: 'todolist'
        }
      }
    })

  // .state('app.addqty', {
  //   url: '/addqty',
  //   views: {
  //       'menuContent': {
  //           templateUrl: 'templates/nikki/addqty.html',
  //           controller: 'addqty'
  //       }
  //   }
  // })





















  ///////////////////////////////////////ADMIN USER////////////////////////////////////////
    .state('admin', {
      url: '/admin',
      abstract: true,
      templateUrl: 'templates/admin_side/adminmenu.html',
      controller: 'AppCtrl'
    })

    .state('admin.adminprofile', {
    url: '/adminprofile',
    views: {
      'menuContent': {
        templateUrl: 'templates/admin_side/adminprofile.html',
        controller: 'adminuser'
      }
    }
  })

    .state('admin.listofitems', {
    url: '/listofitems',
    views: {
      'menuContent': {
        templateUrl: 'templates/admin_side/listofitems.html',
        // controller: 'adminuser'
      }
    }
  })

    .state('admin.adminsearch', {
    url: '/adminsearch',
    views: {
      'menuContent': {
        templateUrl: 'templates/admin_side/adminsearch.html',
        // controller: 'adminuser'
      }
    }
  })

    .state('admin.adminpromos', {
    url: '/adminpromos',
    views: {
      'menuContent': {
        templateUrl: 'templates/admin_side/adminpromos.html',
        // controller: 'adminuser'
      }
    }
  })

  ///////////////////////////////////////END OF ADMIN USER////////////////////////////////////////
  ///////////////////////////////////////CASHIER USER////////////////////////////////////////
    .state('cashier', {
      url: '/cashier',
      abstract: true,
      templateUrl: 'templates/cashier_side/cashier_menu.html',
      controller: 'AppCtrl'
    })

    .state('cashier.cashier_profile', {
    url: '/cashier_profile',
    views: {
      'menuContent': {
        templateUrl: 'templates/cashier_side/cashier_profile.html',
        controller: 'adminuser'
      }
    }
  })

    .state('cashier.cashier_search', {
    url: '/cashier_search',
    views: {
      'menuContent': {
        templateUrl: 'templates/cashier_side/cashier_search.html',
        controller: 'adminuser'
      }
    }
  })

    .state('cashier.cashier_transaction', {
    url: '/cashier_transaction',
    views: {
      'menuContent': {
        templateUrl: 'templates/cashier_side/cashier_transaction.html',
        controller: 'adminuser'
      }
    }
  })
  ///////////////////////////////////////END OF CASHIER USER////////////////////////////////////////
  ///////////////////////////////////////NORMAL USER//////////////////////////////////////// 
    .state('app', {
      url: '/app',
      abstract: true,
      templateUrl: 'templates/menu.html',
      controller: 'AppCtrl'
    })

    .state('login', {
      url: '/login',
      templateUrl: 'templates/login.html'
    })

    .state('firstpage', {
      url: '/firstpage',
      templateUrl: 'templates/first.html'
    })

    .state('signup', {
      url: '/signup',
      templateUrl: 'templates/signup.html'
    })
  
  .state('app.search', {
    url: '/search',
    views: {
      'menuContent': {
        templateUrl: 'templates/search.html'
      }
    }
  })

  .state('app.profile', {
      url: '/profile',
      views: {
        'menuContent': {
          templateUrl: 'templates/profile.html',
          controller: 'ProfileCtrl'
        }
      }
    })
    .state('app.transaction', {
      url: '/transaction',
      views: {
        'menuContent': {
          templateUrl: 'templates/transactions.html',
          controller: 'PlaylistsCtrl'
        }
      }
    });

  // .state('app.single', {
  //   url: '/transaction',
  //   views: {
  //     'menuContent': {
  //       templateUrl: 'templates/transaction.html',
  //       controller: 'PlaylistCtrl'
  //     }
  //   }
  // });
  // if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise('/firstpage');
});