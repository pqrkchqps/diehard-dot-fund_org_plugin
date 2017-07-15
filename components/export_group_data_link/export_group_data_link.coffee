angular.module('diehardFundApp').directive 'exportGroupDataLink', ->
  scope: {group: '='}
  templateUrl: 'generated/components/export_group_data_link/export_group_data_link.html'
  controller: ($scope, $window, AbilityService, ModalService, ChoosePlanModal, ChargifyService) ->

    $scope.ability = -> AbilityService

    $scope.downloadExport = ->
      $window.open "/g/#{$scope.group.key}/export", '_blank'
      true

    $scope.choosePlan = ->
      ModalService.open ChoosePlanModal, group: -> $scope.group
