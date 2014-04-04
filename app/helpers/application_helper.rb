# -*- coding: utf-8 -*-

module ApplicationHelper
  #   nav_item 'Foo', '/foo', 'controller_foo', 'controller_bar'
  #   nav_item 'Foo', '/foo', %w(controller_foo controller_bar)
  #   nav_item 'Foo', '/foo', 'controller_foo', controller_bar: ['edit', 'new']
  #   nav_item 'Foo', '/foo', controller_foo: 'index', controller_bar: ['edit', 'new']
  #   nav_item 'Foo', '/foo', controller_foo: 'index', controller_bar: ['edit', 'new']
  #   nav_item 'Foo', '/foo', active_top_nav: :foos
  def nav_item(name, url, activator = '', opts = {})
    if (activator.is_a?(String) && request.path.start_with?(activator)) ||
      (activator.is_a?(Regexp) && request.path =~ activator) ||
      (activator.is_a?(Hash) && defined?(active_top_nav) && active_by_specified_activator?(activator)) ||
      (activator.is_a?(Hash) && !defined?(active_top_nav) && active_by_specified_controller?(activator))
      opts.merge!({ class: 'active' })
    end

    content_tag :li, opts do
      link_to name, url
    end
  end

  def active_by_specified_activator?(activator)
    active_top_nav.to_s == activator[:active_top_nav].to_s
  end

  def active_by_specified_controller?(activator)
    controller_name.in?(activator) ||
    Array.wrap(activator[controller_name.to_sym]).include?(action_name)
  end

  def nav_element(text, url, wrapper_options = {})
    content_tag :li, wrapper_options do
      link_to text, url
    end
  end

  def l(item, options = {})
    if item
      I18n.l(item, options)
    end
  end

  def undecorated(object)
    if object.is_a? Draper::Decorator
      object.source
    else
      object
    end
  end

  def data_controller_name
    if controller.class.name
      controller.class.name.gsub("::", "_")
    else
      controller.to_s
    end
  end

  def object_link(object, path_proc, opts = {})
    opts[:for_empty] ||= "-"
    opts[:name_method] ||= "to_s"
    opts[:link_opts] ||= {}

    if object
      link_to object.public_send(opts[:name_method]),
              path_proc.call(object),
              opts[:link_opts]
    else
      opts[:for_empty]
    end
  end

  def links_for_collection(collection, path_proc, opts = {})
    collection.map do |object|
      object_link object, path_proc, opts
    end
  end

  def linked_names(collection, path_proc, opts = {})
    opts[:join_with] ||= ", "
    opts[:for_empty] ||= "-"
    links_for_collection(collection, path_proc, opts).join(opts[:join_with])
                                                     .html_safe.presence || opts[:for_empty]
  end

  def collection_list(collection, opts = {})
    opts[:for_empty] ||= "-"
    opts[:name_method] ||= "to_s"
    opts[:join_with] ||= ", "

    if collection && collection.any?
      collection.map do |member|
        member.public_send(opts[:name_method])
      end.join(opts[:join_with]).presence || opts[:for_empty]
    else
      opts[:for_empty]
    end
  end

  def site_url(site)
    if (url = site).present?
      if url.starts_with?("http")
        url
      else
        "http://#{url}"
      end
    end
  end

  def site_link(site)
    link_to site, site_url(site)
  end

  def confirmation_icon(value)
    if value
      content_tag(:span, '✓', class: 'badge badge-success icon-confirm')
    else
      content_tag(:span, '✘', class: 'badge badge-important icon-reject')
    end
  end
end
