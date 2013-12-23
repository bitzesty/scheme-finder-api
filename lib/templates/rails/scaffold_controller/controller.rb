<%- if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"

<%- end -%>
<%- module_namespacing do -%>
<%- if class_path.any? -%>
module <%= class_path.map(&:camelcase).join("::") %>
  class <%= controller_file_name.camelcase %>Controller < <%= class_path.map(&:camelcase).join("::") %>::BaseController
    expose(:<%= plural_name %>)
    expose(:<%= singular_name %>, attributes: :<%= singular_name %>_params)

    def create
      if <%= singular_name %>.save
        redirect_to [<%= ":#{class_path.join(", :")}, " if class_path.any? %><%= singular_name %>],
                    notice: "<%= singular_name.camelcase %> created"
      else
        render :new
      end
    end

    def update
      if <%= singular_name %>.save
        redirect_to [<%= ":#{class_path.join(", :")}, " if class_path.any? %><%= singular_name %>],
                    notice: "<%= singular_name.camelcase %> updated"
      else
        render :edit
      end
    end

    def destroy
      <%= singular_name %>.destroy
      redirect_to [<%= ":#{class_path.join(", :")}, " if class_path.any? %><%= singular_name %>],
                  notice: "<%= singular_name.camelcase %> deleted"
    end

    def new
    end

    def edit
    end

    def index
    end

    def show
    end

    private

    def <%= "#{singular_name}_params" %>
      <%- if attributes_names.empty? -%>
      params[:<%= singular_name %>]
      <%- else -%>
      params.require(:<%= singular_name %>).permit(
        <%= attributes_names.map { |name| ":#{name}" }.join(", ") %>
      )
      <%- end -%>
    end
  end
end
<%- else -%>
<%-# no module, only class -%>
class <%= controller_class_name %>Controller < ApplicationController
  expose(:<%= plural_name %>)
  expose(:<%= singular_name %>, attributes: :<%= singular_name %>_params)

  def create
    if <%= singular_name %>.save
      redirect_to [<%= ":#{class_path.join(", :")}, " if class_path.any? %><%= singular_name %>],
                  notice: "<%= singular_name.camelcase %> created"
    else
      render :new
    end
  end

  def update
    if <%= singular_name %>.save
      redirect_to [<%= ":#{class_path.join(", :")}, " if class_path.any? %><%= singular_name %>],
                  notice: "<%= singular_name.camelcase %> updated"
    else
      render :edit
    end
  end

  def destroy
    <%= singular_name %>.destroy
    redirect_to [<%= ":#{class_path.join(", :")}, " if class_path.any? %><%= singular_name %>],
                notice: "<%= singular_name.camelcase %> deleted"
  end

  def new
  end

  def edit
  end

  def index
  end

  def show
  end

  private

  def <%= "#{singular_name}_params" %>
    <%- if attributes_names.empty? -%>
    params[:<%= singular_name %>]
    <%- else -%>
    params.require(:<%= singular_name %>).permit(
      <%= attributes_names.map { |name| ":#{name}" }.join(", ") %>
    )
    <%- end -%>
  end
end
<%- end -%>
<%- end -%>
