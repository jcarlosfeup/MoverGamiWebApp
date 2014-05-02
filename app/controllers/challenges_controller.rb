class ChallengesController < ApplicationController
  # GET /challenges
  # GET /challenges.json
  def index
    @challenges = Challenge.all
    @chls_json = @challenges.map{ |e| {:challenge => e}}

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chls_json }
    end
  end

  # GET /challenges/1
  # GET /challenges/1.json
  def show
    @challenge = Challenge.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @challenge }
    end
  end

  # GET /challenges/new
  # GET /challenges/new.json
  def new
    @challenge = Challenge.new
    @trigger = @challenge.build_trigger
    @t_feature = @trigger.build_feature
    @t_activity = @trigger.build_activity
    @goal = @challenge.build_goal
    @g_feature = @goal.build_feature
    @g_activity = @goal.build_activity

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @challenge }
    end
  end

  # GET /challenges/1/edit
  def edit
    @challenge = Challenge.find(params[:id])
    @trigger = @challenge.build_trigger
    @goal = @challenge.build_goal
    @tf_trigger = @trigger.build_timeframe
    @tf_goal = @goal.build_timeframe
  end

  # POST /challenges
  # POST /challenges.json
  def create
    @challenge = Challenge.new(challenge_params)
    @feature = Feature.find(params[:feature][:id])
    @activity = Activity.find(params[:activity][:id])
    
    @trigger = Restriction.new(:threshold => params[:challenge][:trigger_attributes][:threshold])
    @trigger.feature = @feature
    @trigger.activity = @activity

    @goal = Restriction.new(:threshold => params[:challenge][:goal_attributes][:threshold])
    @goal.feature = @feature
    @goal.activity = @activity
    
    if params[:type_limit][:id] != "" and params[:type_limit_goal][:id] != ""
      @tf_trigger = Timeframe.find(params[:type_limit][:id])
      @tf_goal = Timeframe.find(params[:type_limit_goal][:id])
    end

    if @tf_trigger.type_limit == "Custom"
        @new_timeframe = Timeframe.new(:type_limit => "Custom",:value => params[:trigger_timeframe][:value])
        @trigger.timeframe = @new_timeframe
      else
        @trigger.timeframe = @tf_trigger
    end
    

    if @tf_goal.type_limit == "Custom"
        @new_tf = Timeframe.new(:type_limit => "Custom",:value => params[:goal_timeframe][:value])
        @goal.timeframe = @new_tf
      else
        @goal.timeframe = @tf_goal
    end
    
    @trigger.save
    @goal.save
    
    @challenge.trigger = @trigger
    @challenge.goal = @goal


    respond_to do |format|
      if @challenge.save
        format.html { redirect_to @challenge, notice: 'Challenge was successfully created.' }
        format.json { render json: @challenge, status: :created, location: @challenge }
      else
        format.html { render action: "new" }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /challenges/1
  # PATCH/PUT /challenges/1.json
  def update
    @challenge = Challenge.find(params[:id])
    @trigger = Restriction.find(@challenge.trigger.id)
    @goal = Restriction.find(@challenge.goal.id)
    @trigger.update_attribute(:threshold,params[:challenge][:trigger_attributes][:threshold])
    @goal.update_attribute(:threshold,params[:challenge][:goal_attributes][:threshold])
 
    @feature = Feature.find(params[:feature][:id])
    @activity = Activity.find(params[:activity][:id])

    @tf_trigger = Timeframe.find(params[:type_limit][:id])
    if params[:type_limit][:id] == "1"
      @tf_trigger.update_attributes(:type_limit => "Daily",:value => 86400)
    elsif params[:type_limit][:id] == "2"
      @tf_trigger.update_attributes(:type_limit => "Weekly",:value => 604800) 
    elsif params[:type_limit][:id] == "3"
      @tf_trigger.update_attributes(:type_limit => "Monthly",:value => 2592000) 
    else 
      @tf_trigger.update_attributes(:type_limit => "Custom",:value => params[:trigger_timeframe][:value]) 
    end

    @tf_goal = Timeframe.find(params[:type_limit_goal][:id])
    if params[:type_limit_goal][:id] == "1"
      @tf_goal.update_attributes(:type_limit => "Daily",:value => 86400)
    elsif params[:type_limit_goal][:id] == "2"
      @tf_goal.update_attributes(:type_limit => "Weekly",:value => 604800) 
   elsif params[:type_limit_goal][:id] == "3"
      @tf_goal.update_attributes(:type_limit => "Monthly",:value => 2592000) 
    else
      @tf_goal.update_attributes(:type_limit => "Custom",:value => params[:goal_timeframe][:value]) 
    end

    @trigger.timeframe = @tf_trigger
    @goal.timeframe = @tf_goal
    
    @trigger.feature = @feature
    @trigger.activity = @activity
    @goal.feature = @feature
    @goal.activity = @activity
    
    @trigger.save
    @goal.save

    respond_to do |format|
      if @challenge.update_attributes(challenge_params)
        format.html { redirect_to @challenge, notice: 'Challenge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challenges/1
  # DELETE /challenges/1.json
  def destroy
    @challenge = Challenge.find(params[:id])
    @trigger = Restriction.find(@challenge.trigger.id)
    @goal = Restriction.find(@challenge.goal.id)

    if @trigger.timeframe.type_limit == "Custom" 
      @trigger.timeframe.destroy
    end

    if @goal.timeframe.type_limit == "Custom" 
      @goal.timeframe.destroy
    end
      
   @trigger.destroy
   @goal.destroy
   @challenge.destroy

    respond_to do |format|
      format.html { redirect_to challenges_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def challenge_params
      params.require(:challenge).permit(:description,:trigger,:goal)
    end
end
