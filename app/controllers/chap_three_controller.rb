class ChapThreeController < ApplicationController
  def create   
    marker = Marker.new(params[:m])
    if marker.save
      res={:success=>true,:content=>"<div><strong>found </strong>#{marker.found}</div><div><strong>left </strong>#{marker.left}</div>", :icon=>marker.icon}
    else
      res={:success=>false,:content=>"Could not save the marker"}
    end
    render :text=>res.to_json
  end
  
  def list
ActiveRecord::Base.include_root_in_json = false
    render :text=>(Marker.find :all).to_json
  end
end