class TestsController < ApplicationController
    def create_group
        @group = Group.new({name: "Sam Son Beach", description: "Best place in the world !"})
        @group.owner = current_user
        @group.save
        render plain: "Created " + @group.id.to_s
    end

    def show_group
        @group = Group.find params[:id]
        result = "Show Group " + @group.id.to_s + "\n"
        result = result + " \n Name: " + @group.name + " \n Description: " + @group.description + " \n Owner: " + @group.owner.email + " \n Number of members: " + @group.members.size.to_s + "\n"
        @group.members.each do |member|
            result = result + "\n\t #{member.email} joined group #{@group.id}"
        end
        render plain: result
    end

    def destroy_group
    end

    def add_member_to_group
        group_id = params[:group]
        member_id = params[:member]
        @group = Group.find group_id
        @member = User.find member_id

        @group.members.push @member
        @group.save
        render plain: "Added member " + @member.id.to_s + " to group " + @group.id.to_s
    end
end
