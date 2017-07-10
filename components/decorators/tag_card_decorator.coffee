angular.module('loomioApp').config ($provide) ->
  $provide.decorator 'tagCardDirective', ($delegate, ModalService, ChoosePlanModal) ->
    controller = $delegate[0].controller
    $delegate[0].controller = ($scope) ->
      controller($scope)
      createTag = $scope.createTag
      $scope.createTag = ->
        if $scope.group.subscriptionKind == 'paid'
          createTag()
        else
          ModalService.open ChoosePlanModal, group: -> $scope.group

    $delegate
