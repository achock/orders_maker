angular.module('ordersmaker').controller("CustomerListCtrl", [
  '$scope', 'CustomerService', '$modal',
  ($scope, CustomerService, $modal)->

    $scope.editCustomer = (customer) ->
      modalInstance = $modal.open({
        templateUrl: 'customer/edit.html',
        controller: 'CustomerEditModalCtrl'
        size: 'lg'
        resolve:
          customer: ->
            customer
      })

      modalInstance.result.then(->
        console.log 'edit closed'
      )

    CustomerService.list().then((customers) ->
      $scope.customers = customers
      console.dir customers
    )
])
