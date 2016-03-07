module Plugins
  module LoomioOrg
    class Plugin < Plugins::Base
      setup! :loomio_org do |plugin|
        plugin.enabled = true

        plugin.use_component :angular_feedback_card, outlet: 'after_start_menu'

        plugin.use_page :about,                    'pages#about'
        plugin.use_page :privacy,                  'pages#privacy'
        plugin.use_page :purpose,                  'pages#purpose'
        plugin.use_page :services,                 'pages#services'
        plugin.use_page :terms_of_service,         'pages#terms_of_service'
        plugin.use_page :third_parties,            'pages#third_parties'
        plugin.use_page :try_it,                   'pages#try_it'
        plugin.use_page :wallets,                  'pages#wallets'
        plugin.use_page :pricing,                  'pages#pricing'
        plugin.use_page :translation,              'pages#translation'
        plugin.use_page :crowdfunding_celebration, 'pages#crowdfunding_celebration'

        plugin.use_page :blog,          'http://blog.loomio.org',                                redirect: true
        plugin.use_page :press,         'http://blog.loomio.org/press-pack',                     redirect: true
        plugin.use_page :"press-pack",  'http://blog.loomio.org/press-pack',                     redirect: true
        plugin.use_page :roadmap,       'https://trello.com/b/tM6QGCLH/loomio-roadmap',          redirect: true
        plugin.use_page :community,     'https://www.loomio.org/g/WmPCB3IR/loomio-community',    redirect: true
        plugin.use_page :timeline,      'http://www.tiki-toki.com/timeline/entry/313361/Loomio', redirect: true
      end
    end
  end
end
