angular.module('diehard_fundApp').config ($provide) ->
  $provide.decorator 'installSlackCardDirective', ($delegate, ModalService, ChoosePlanModal) ->
    controller = $delegate[0].controller
    $delegate[0].controller = ($scope) ->
      controller($scope)
      install = $scope.install
      $scope.install = ->
        if $scope.group.parentOrSelf().subscriptionKind == 'paid'
          install()
        else
          ModalService.open ChoosePlanModal, group: -> $scope.group.parentOrSelf()

    $delegate
