module Plugins
  module LoomioOrg
    class Plugin < Plugins::Base
      setup! :loomio_org_plugin do |plugin|
        plugin.enabled = true

        LOOMIO_ORG_PAGES = %w(about
                              browser_not_supported
                              crowdfunding_celebration
                              marketing
                              pricing
                              translation
                              wallets)
        LOOMIO_ORG_PAGES.each { |page| plugin.use_page page, "pages##{page}" }
        plugin.use_class 'controllers/pages_controller'

        plugin.use_page :help,             'http://help.loomio.org',                                                 redirect: true
        plugin.use_page :blog,             'http://blog.loomio.org',                                                 redirect: true
        plugin.use_page :press,            'http://blog.loomio.org/press-pack',                                      redirect: true
        plugin.use_page :"press-pack",     'http://blog.loomio.org/press-pack',                                      redirect: true
        plugin.use_page :roadmap,          'https://trello.com/b/tM6QGCLH/loomio-roadmap',                           redirect: true
        plugin.use_page :community,        'https://www.loomio.org/g/WmPCB3IR/loomio-community',                     redirect: true
        plugin.use_page :timeline,         'http://www.tiki-toki.com/timeline/entry/313361/Loomio',                  redirect: true
        plugin.use_page :privacy,          'https://loomio.gitbooks.io/manual/content/en/privacy_policy.html',       redirect: true
        plugin.use_page :terms_of_service, 'https://loomio.gitbooks.io/manual/content/en/terms_of_service.html',     redirect: true
        plugin.use_page :third_parties,    'https://loomio.gitbooks.io/manual/content/en/third_party_services.html', redirect: true
        plugin.use_page :newsletter,       'http://eepurl.com/b51x_b',                                               redirect: true

        plugin.extend_class ApplicationHelper do
          def hosted_by_loomio?
            true
          end
        end

        plugin.use_page('/', 'pages#marketing')
      end
    end
  end
end
