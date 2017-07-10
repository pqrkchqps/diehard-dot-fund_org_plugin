angular.module('loomioApp').config ($provide) ->
  $provide.decorator 'subgroupsCardDirective', ($delegate, ModalService, ChoosePlanModal) ->
    controller = $delegate[0].controller
    $delegate[0].controller = ($scope) ->
      controller($scope)
      startSubgroup = $scope.startSubgroup
      $scope.startSubgroup = ->
        if $scope.group.parentOrSelf().subscriptionKind == 'paid'
          startSubgroup()
        else
          ModalService.open ChoosePlanModal, group: -> $scope.group.parentOrSelf()

    $delegate
