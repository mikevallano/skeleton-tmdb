class InvitesController < ApplicationController
  before_action :set_invite, only: [:show, :edit, :update, :destroy]

  # GET /invites
  # GET /invites.json
  def index
    @invites = Invite.all
  end

  # GET /invites/1
  # GET /invites/1.json
  def show
  end

  # GET /invites/new
  def new
    @invite = Invite.new
  end

  # GET /invites/1/edit
  def edit
  end

  # POST /invites
  # POST /invites.json
  def create
    @invite = Invite.new(invite_params)
    @invite[:token] = @invite.generate_token
    @invitee = @invite.find_invitee

    if @invite.to_existing_user?
        respond_to do |format|
        if @invite.save
          #round out the invites TODO: add these methods to user.rb instead:
          @invitee.memberships << Membership.new(member_id: @invitee.id, list_id: @invite.list_id)
          @invite.sender.memberships << Membership.new(member_id: @invite.sender_id, list_id: @invite.list_id)
          ExistingInviteMailer.existing_invite_mailer(@invite).deliver_now

          format.html { redirect_to list_path(@invite.list), notice: 'Invite was successfully created.' }
          format.json { render :show, status: :created, location: @invite }
        else
          format.html { render :new }
          format.json { render json: @invite.errors, status: :unprocessable_entity }
        end
      end #end respond_to

    else #exising user?

      respond_to do |format|
        if @invite.save
          InviteMailer.new_invite_mailer(@invite).deliver_now
          #assign the sender the membership as well, TODO: move logic to user.rb
          @invite.sender.memberships << Membership.new(member_id: @invite.sender_id, list_id: @invite.list_id)
          format.html { redirect_to list_path(@invite.list), notice: 'Invite was successfully created.' }
          format.json { render :show, status: :created, location: @invite }
        else
          format.html { render :new }
          format.json { render json: @invite.errors, status: :unprocessable_entity }
        end
      end
    end #determining existing user
  end

  # PATCH/PUT /invites/1
  # PATCH/PUT /invites/1.json
  def update
    respond_to do |format|
      if @invite.update(invite_params)
        format.html { redirect_to @invite, notice: 'Invite was successfully updated.' }
        format.json { render :show, status: :ok, location: @invite }
      else
        format.html { render :edit }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invites/1
  # DELETE /invites/1.json
  def destroy
    @invite.destroy
    respond_to do |format|
      format.html { redirect_to invites_url, notice: 'Invite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invite
      @invite = Invite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invite_params
      params.require(:invite).permit(:sender_id, :receiver_id, :token, :email, :list_id)
    end
end
