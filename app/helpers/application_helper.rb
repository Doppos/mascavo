module ApplicationHelper

  def listable(type, item)
    list = List.select(:name).where(:listable_type => type, :listable_item => item, :account_id => current_account)
    list.map { |item| [item.name, item.name] }
  end

  def source_collection
    collection = Source.select([:id, :value, :label]).where(:active => true, :account_id => current_account)
    collection.map { |source| [source.name, source.id] }
  end

  def nav_link_to(link_text, link_path, options={})
    match = options.delete(:match)
    wrap_class = options.delete(:wrap_class)
    wrap_class = wrap_class.to_s << " active" if current_page?(link_path, match)
    content_tag :li, :class => wrap_class do
      link_to link_text, link_path, options
      #yield if block_given?
    end
  end

  def iconed(text, *names)
    caret = icon = ""
    caret = content_tag(:span, nil, :class => "caret") if names.delete(:dropdown)
    icon = content_tag(:i, nil, :class => names.map{|name| "icon-#{name.to_s.gsub('_','-')}"}) unless names.empty?
    [icon, text, caret].join(" ").strip.html_safe
  end

  def labeled(text, type = nil)
    name = type.nil? ? "label" : "label label-#{type.to_s.gsub('_','-')}"
    content_tag :span, text, :class => name
  end

  def badged(text, type = nil)
    name = type.nil? ? "badge" : "badge badge-#{type.to_s.gsub('_','-')}"
    content_tag :span, text, :class => name
  end

  def current_page
    url_pieces = request.path.split('/')
    current_page = ["sign_in", "sign_up"].include?(url_pieces.third) ? url_pieces.third : url_pieces.second
  end

  def current_page?(options, match = :default)
    url_string = url_for(options)

    if match == :first
      request_uri = "/" << request.path.split('/').second.to_s
    elsif url_string.index("?") || match == :fullpath
      request_uri = request.fullpath
    else
      request_uri = request.path
    end

    if url_string =~ /^\w+:\/\//
      url_string == "#{request.protocol}#{request.host_with_port}#{request_uri}"
    else
      url_string == request_uri
    end
  end

end
