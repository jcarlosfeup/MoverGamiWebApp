class FactsController < ApplicationController
  # GET /facts
  # GET /facts.json
  def index
    @facts = Fact.all
    @facts_json = @facts.map{ |e| {:fact => e}}

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @facts_json }
    end
  end

  # GET /facts/1
  # GET /facts/1.json
  def show
    @fact = Fact.find(params[:id])
    @restriction = Restriction.find(@fact.restriction_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fact }
    end
  end

  # GET /facts/new
  # GET /facts/new.json
  def new
    @fact = Fact.new
    @restriction = @fact.build_restriction
    @feature = @restriction.build_feature
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fact }
    end
  end

  # GET /facts/1/edit
  def edit
    @fact = Fact.find(params[:id])
  end

  # POST /facts
  # POST /facts.json
  def create
    @fact = Fact.new(fact_params)
    @feature = Feature.find(params[:feature][:id])

    @restriction = Restriction.new(:threshold => params[:fact][:threshold])
    @restriction.feature = @feature
    @restriction.save
    
    @fact.restriction = @restriction
    
  respond_to do |format|
      if @fact.save
        format.html { redirect_to @fact, notice: 'Fact was successfully created.' }
        format.json { render json: @fact, status: :created, location: @fact }
      else
        format.html { render action: "new" }
        format.json { render json: @fact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facts/1
  # PATCH/PUT /facts/1.json
  def update
    @fact = Fact.find(params[:id])
    @restriction = Restriction.find(@fact.restriction_id)
    @restriction.update_attribute(:threshold,params[:fact][:threshold])
    @feature = Feature.find(params[:feature][:id])
    
    @restriction.feature = @feature
    @restriction.activity = @activity
    @restriction.save

    respond_to do |format|
      if @fact.update_attributes(fact_params)
        format.html { redirect_to @fact, notice: 'Fact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facts/1
  # DELETE /facts/1.json
  def destroy
    @fact = Fact.find(params[:id])
    @restriction = Restriction.find(@fact.restriction.id)
  
    @restriction.destroy
    @fact.destroy

    respond_to do |format|
      format.html { redirect_to facts_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def fact_params
      params.require(:fact).permit(:description,:restriction)
    end
end
