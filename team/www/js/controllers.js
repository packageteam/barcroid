angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope, $ionicModal, $timeout) {

  // With the new view caching in Ionic, Controllers are only called
  // when they are recreated or on app start, instead of every page change.
  // To listen for when this page is active (for example, to refresh data),
  // listen for the $ionicView.enter event:
  //$scope.$on('$ionicView.enter', function(e) {
  //});

  // Form data for the login modal
  $scope.loginData = {};

  // Create the login modal that we will use later
  $ionicModal.fromTemplateUrl('templates/login.html', {
    scope: $scope
  }).then(function(modal) {
    $scope.modal = modal;
  });

  // Triggered in the login modal to close it
  $scope.closeLogin = function() {
    $scope.modal.hide();
  };

  // Open the login modal
  $scope.login = function() {
    $scope.modal.show();
  };

  // Perform the login action when the user submits the login form
  $scope.doLogin = function() {
    console.log('Doing login', $scope.loginData);

    // $scope.state.go('search');
    // Simulate a login delay. Remove this and replace with your login
    // code if using a login system
    $timeout(function() {
      $scope.closeLogin();
    }, 1000);
  };
})

.controller('PlaylistsCtrl', function($scope) {
  $scope.playlists = [
    { title: 'New Transaction', id: 1 },
    { title: 'History', id: 2 },
    
  ];
})

.controller('ProfileCtrl', function($scope) {
  $scope.profiles = [
    { title: 'Firstname:    Danica', id: 1 },
    { title: 'Lastname:     Pacana', id: 2 },
    { title: 'Username:     danicapacana', id: 3 },
    { title: 'Email:        danica.pacana1195@gmail.com', id: 4 },
    { title: 'Password:     ******', id: 5 },
    { title: 'Contact:      09351370463', id: 6 },
    { title: 'Address:      Balulang', id: 7 }
  ];
})



.controller('PlaylistCtrl', function($scope, $stateParams) {
});
