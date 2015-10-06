angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope, $ionicModal, $timeout) {
  $scope.loginData = {};

  $ionicModal.fromTemplateUrl('templates/menu.html', {
    scope: $scope
  }).then(function(modal) {
    $scope.modal = modal;
  });

  $scope.closeLogin = function() {
    $scope.modal.hide();
  };

  $scope.login = function() {
    $scope.modal.show();
  };

  $scope.doLogin = function() {
    console.log('Doing login', $scope.loginData);
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
    { name: 'Pacana, Danica', username: 'danicapacana', email: 'danica.pacana1195@gmail.com', contact: '09351370463', address: 'Balulang', id: 1 },
  ];
})

.controller('viewitem', function($scope, $http, $ionicModal, $state){
  $scope.item = []; 
  $scope.selecteddetails = [];
  $scope.totalforid = {};
  $scope.message = "";

  $http.get("http://localhost/barcroid_backend/transaction/viewitem/?id=2").success(function (response) {
    $scope.item = response;
   });
  $http.get("http://localhost/barcroid_backend/transaction/selecteddetails/?id=2").success(function (response){
    $scope.selecteddetails = response;
  });
  $http.get("http://localhost/barcroid_backend/transaction/totalitem/?id=2").success(function (response){
    // $scope.totalforid = response;
    $scope.totalforid = response[1];
    console.log(response);
    console.log($scope.totalforid);
  });

  $ionicModal.fromTemplateUrl('templates/nikki/budgetedamnt.html', {
    scope: $scope
  }).then(function(modal) {
    $scope.modal = modal;
  });

  $scope.closeamnt = function() {
    $scope.modal.hide();
  };

  $scope.addbudgetedamnt = function() {
    $scope.modal.show();
  };

  $scope.addamnt = function(amnt){
    $scope.amnt = amnt;
    $http.get("http://localhost/barcroid_backend/transaction/budgetedamnt/?amnt="+ $scope.amnt).success(function (response){
      })
    $scope.reload();
    $scope.closeamnt();
  }

  $scope.reload = function(){
    location.reload();
  }

  $scope.submitotcashier = function(){
    $scope.status = 0;
    $http.get("http://localhost/barcroid_backend/transaction/submitotcashier/?status=" + $scope.status).success(function(response){
    })

    $scope.reload();
    $scope.message = "You've successfully submit it to cashier!";
  }

  $scope.cancel = function(){

  }

})

.controller('AddItemTransaction', function($scope, $http, $ionicModal, $timeout, $interval, $state) {
  $scope.sendavailableitem = [];

  $scope.searchitem = function (newitem){
    $scope.item = newitem;
    $scope.availableitem = [];
    $http.get("http://localhost/barcroid_backend/transaction/availableitem/?name=" + $scope.item).success(function (response){
      $scope.availableitem = response;
    })
  }

  $scope.addthisqty = function (qty){
    $scope.qty = qty;
    $http.get("http://localhost/barcroid_backend/transaction/ItemQty/?customer_id=2&id=" + $scope.sendavailableitem + "&qty=" + $scope.qty).success(function (response){
    })
    $http.get("http://localhost/barcroid_backend/transaction/stock/?item=" + $scope.sendavailableitem + "&eqty=" + $scope.qty).success(function (response){
    })
    $scope.qty = "";
    $scope.closeaddqty();
    $state.go("app.create_new_transaction");
    $scope.reload();
  }

  $scope.reload = function(){
    location.reload();
  }

  $ionicModal.fromTemplateUrl('templates/nikki/addqty.html', {
    scope: $scope
  }).then(function(modal) {
    $scope.modal = modal;
  });

  $scope.closeaddqty = function() {
    $scope.modal.hide();
  };

  $scope.additem = function(item) {
    $scope.sendavailableitem = item;
      $http.get("http://localhost/barcroid_backend/transaction/TransactionItem/?item=" + $scope.sendavailableitem).success(function (response){
      console.log(response);
      })
    $scope.modal.show();
  };
})

.controller('budgetedamnt', function($scope, $ionicModal){
  $ionicModal.fromTemplateUrl('templates/nikki/addqty.html', {
    scope: $scope
  }).then(function(modal) {
    $scope.modal = modal;
  });

  $scope.closeaddqty = function() {
    $scope.modal.hide();
  };

  $scope.additem = function(id) {
    $scope.sendavailableitem = id;
      $http.get("http://localhost/barcroid_backend/transaction/TransactionItem/?id=" + $scope.sendavailableitem).success(function (response){

      })
    $scope.modal.show();
  };
})

.controller('edititem', function($scope, $http, $ionicModal){
  $scope.item = [];
  $http.get("http://localhost/barcroid_backend/transaction/?id=2").success(function (response){
    $scope.item = response;
  })

  $scope.edit = function(details, idx){
    $scope.key = idx;
    $scope.id = details.items_id;
    $scope.brand_details = details.brand_details;
    $scope.items_name = details.items_name;
    $scope.price = details.items_price;
    $scope.unit = details.items_unit;
    $scope.qty = details.qty;
  }

  $scope.addedit = function (qty, id){
    $scope.item = id;
    $scope.qty = qty;
    $http.get("http://localhost/barcroid_backend/transaction/qty/?qty=" + $scope.qty + "&item=" + $scope.item).success(function (response){
    })
    $scope.cancel();
  }

  $scope.cancel = function(){
    $scope.name = "";
    $scope.price = "";
    $scope.qty = "";
    $scope.total = "";
  }

  $scope.delete = function (item){
    // $http.get("http://localhost/barcroid_backend/transaction/deleteitem/?id=")
    console.log(item);
  }

  $ionicModal.fromTemplateUrl('templates/nikki/deleteitem.html', {
    scope: $scope
  }).then(function(modal) {
    $scope.modal = modal;
  });

  $scope.closedelete = function() {
    $scope.modal.hide();
  };

  $scope.showdeletemodal = function(id){
    $scope.itemdeleted = id;
    // console.log(id);
    $scope.modal.show();
  };

  $scope.deleteitem = function() {
    $http.get("http://localhost/barcroid_backend/transaction/item/?item=" + $scope.itemdeleted).success(function (response){
    });
    $scope.reload();
    $scope.closedelete();
  };

  $scope.reload = function(){
    location.reload();
  }
})

.controller('todolist', function($scope){
  $scope.itemtobuy = [{name: 'Shampoo', qty: '2', price: '10', total: '20'}];
})

/////////////////////////////////////////////////////////////////Admin Side

.controller('adminuser', function($scope) {
  $scope.profiles = [
    { name: 'Daug, Nikki Monique', username: 'kinkin', email: 'daugnik@gmail.com', contact: '09069748094', address: 'El Salvador City', id: 1 },
  ];
})

/////////////////////////////////////////////////////////////////End of Admin Side

//////////////////////////////////////////////////////////////// DANICA's Controller
.controller('signup', function($scope) {
  $scope.datas = [];

  $scope.adduser = function (newdata)
  {
    $scope.datas.push({
      name: $scope.fname,
      username: $scope.username,
      password: $scope.password,
      contact: $scope.contact,
      address: $scope.address

    })
console.log(datas);
  }
})

.controller('PlaylistCtrl', function($scope, $stateParams) {
});
