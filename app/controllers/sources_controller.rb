class SourcesController < ApplicationController

  def new
    @source = Source.new
  end

  def create
    @source = Source.new(params[:source])
    if @source.save
      redirect_to @source, :notice => I18n.t(:source_was_successfully_created)
    else
      render :action => "new"
    end
  end

end
