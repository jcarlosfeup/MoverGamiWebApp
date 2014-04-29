class BadgesController < ApplicationController
  # GET /badges
  # GET /badges.json
  def index
    @badges = Badge.all
    @badges_json = @badges.map{ |e| {:badge => e}}

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @badges_json }
    end
  end

  # GET /badges/1
  # GET /badges/1.json
  def show
    @badge = Badge.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @badge }
    end
  end

  # GET /badges/new
  # GET /badges/new.json
  def new
    @badge = Badge.new
    @restriction = @badge.build_restriction
    @feature = @restriction.build_feature
    @timeframe = @restriction.build_timeframe

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @badge }
    end
  end

  # GET /badges/1/edit
  def edit
    @badge = Badge.find(params[:id])
    @restriction = @badge.build_restriction
    @timeframe = @restriction.build_timeframe
  end

  # POST /badges
  # POST /badges.json
  def create
    @badge = Badge.new(badge_params)
    @restriction = @badge.build_restriction
    @timeframe = @restriction.build_timeframe
    @feature = Feature.find(params[:feature][:id])
    
    if params[:type_limit][:id] != ""
      @timeframe = Timeframe.find(params[:type_limit][:id])
    end

    @restriction = Restriction.new(:threshold => params[:badge][:threshold])
    @restriction.feature = @feature

    if @timeframe.type_limit != nil
      if @timeframe.type_limit == "Custom"
        @new_timeframe = Timeframe.new(:type_limit => "Custom",:value => params[:badge][:badge][:value])
        @restriction.timeframe = @new_timeframe
      else
        @restriction.timeframe = @timeframe
      end
    end

    @restriction.save
    
    @badge.restriction = @restriction

    respond_to do |format|
      if @badge.save
        format.html { redirect_to @badge, notice: 'Badge was successfully created.' }
        format.json { render json: @badge, status: :created, location: @badge }
      else
        format.html { render action: "new" }
        format.json { render json: @badge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /badges/1
  # PATCH/PUT /badges/1.json
  def update
    @badge = Badge.find(params[:id])
    @restriction = Restriction.find(@badge.restriction_id)
    @restriction.update_attribute(:threshold,params[:badge][:threshold])
    @feature = Feature.find(params[:feature][:id])

    if params[:type_limit][:id] != ""
      @timeframe = Timeframe.find(params[:type_limit][:id])
      if params[:type_limit][:id] == "1"
        @timeframe.update_attributes(:type_limit => "Daily",:value => 86400)
      elsif params[:type_limit][:id] == "2"
        @timeframe.update_attributes(:type_limit => "Weekly",:value => 604800) 
      elsif params[:type_limit][:id] == "3"
        @timeframe.update_attributes(:type_limit => "Monthly",:value => 2592000) 
      else 
        @timeframe.update_attributes(:type_limit => "Custom",:value => params[:badge][:badge][:value]) 
      end
    else

      if @restriction.timeframe != nil
        @restriction.timeframe = @restriction.build_timeframe
      end
    end

    @restriction.timeframe = @timeframe
    @restriction.feature = @feature
    @restriction.save

    respond_to do |format|
      if @badge.update_attributes(badge_params)
        format.html { redirect_to @badge, notice: 'Badge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @badge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /badges/1
  # DELETE /badges/1.json
  def destroy
    @badge = Badge.find(params[:id])
    @restriction = Restriction.find(@badge.restriction.id)

    if @restriction.timeframe != nil and @restriction.timeframe.type_limit == "Custom"
      @restriction.timeframe.destroy
    end

    @badge.destroy

    respond_to do |format|
      format.html { redirect_to badges_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def badge_params
      params.require(:badge).permit(:description,:image,:name)
    end
end
