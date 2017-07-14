angular.module('diehard_fundApp').factory 'ChoosePlanModal', ->
  templateUrl: 'generated/components/choose_plan_modal/choose_plan_modal.html'
  size: 'choose-plan-modal'
  controller: ($scope, $window, group, Records, Session, ModalService, ChargifyService, IntercomService) ->
    $scope.group = group

    $scope.choosePaidPlan = (kind) ->
      $window.open ChargifyService.chargifyUrlFor($scope.group, kind)
      true

    $scope.openIntercom = ->
      IntercomService.contactUs()
      true
