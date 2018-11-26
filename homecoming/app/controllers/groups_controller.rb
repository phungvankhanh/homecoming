class GroupsController < ApplicationController
  def new
  end

  def create
    @group = Group.new(group_params)
    @owner = User.find(params[:group][:owner])
    @destination = Destination.find(params[:group][:destination])
    @group.owner = @owner
    @group.destination = @destination
    params[:group][:members].each do |member_id|
      if is_number? member_id
        user = User.find member_id
        @group.members.push(user)
      end
    end
    if @group.save
      redirect_to @group
    else
      render action: :new
    end
  end

  def show
    @group = Group.find params[:id]
  end

  private
  def group_params
    params.require(:group).permit(:name, :description)
  end

  def is_number? string
    true if Float(string) rescue false
  end
end
