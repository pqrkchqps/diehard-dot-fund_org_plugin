class PagesController < ApplicationController
  prepend_view_path 'plugins/loomio_org_plugin/views'
  Plugins::LoomioOrg::Plugin::LOOMIO_ORG_PAGES.each { |page| define_method page, ->{} }

  def marketing
    if current_user_or_visitor.is_logged_in?
      redirect_to dashboard_path
    else
      @stories = BlogStory.order('published_at DESC').limit(4)
      render layout: false
    end
  end

  def third_parties
    @parties = [
      {name: 'Amazon S3',
       description: 'Stores uploaded files and images.',
       link: "http://www.amazon.com/gp/help/customer/display.html?nodeId=468496" },

      {name: "Bing Translate",
       description: 'Inline comment translation. When translations are requested via the translate button that appears when two users of different languages are communicating, we send specific content to Bing for automatic translation.',
       link: "http://www.microsoft.com/privacystatement/en-gb/bing/default.aspx"},

      {name: "Cloudflare",
       link: "http://www.cloudflare.com/security-policy",
       description: 'Caches web content for faster page loads. Cloudflare and the rest of the internet backbone carry pages when requested. These are encrypted end to end.'},

      {name: "Heroku",
       link: "https://www.heroku.com/policy/privacy",
       description: 'Host the Loomio software. They provide the servers we use to run Loomio.org.'},

      {name: "New Relic",
       link: "http://newrelic.com/privacy",
       description: "New relic monitors application performance metrics."},

      {name: "Google analytics",
       link: "http://www.google.com/intl/en/policies/",
       description: 'Tracks page views and other usage statistics. Google gets user IP addresses and other session metadata and urls of pages being visited which have discussion titles and group names.'},

      {name: "Intercom",
       link: "http://docs.intercom.io/privacy",
       description: 'Our CRM system, a way for our customer support to keep in touch with users. They receive user and group names and session metadata.'},

      {name: 'Facebook',
       link: "https://www.facebook.com/about/privacy/",
       description: 'To allow you to login via your Facebook account.'},

      {name: "Google",
       link: "http://www.google.com/policies/privacy/",
       description: 'We use Google to log in via your Google account. Optionally you can authorize us to download your Google contacts when inviting people to your group.'}
    ]
  end
end