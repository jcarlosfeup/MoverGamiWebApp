class TimeframesController < ApplicationController
  # GET /timeframes
  # GET /timeframes.json
  def index
    @timeframes = Timeframe.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @timeframes }
    end
  end

  # GET /timeframes/1
  # GET /timeframes/1.json
  def show
    @timeframe = Timeframe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @timeframe }
    end
  end

  # GET /timeframes/new
  # GET /timeframes/new.json
  def new
    @timeframe = Timeframe.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @timeframe }
    end
  end

  # GET /timeframes/1/edit
  def edit
    @timeframe = Timeframe.find(params[:id])
  end

  # POST /timeframes
  # POST /timeframes.json
  def create
    @timeframe = Timeframe.new(timeframe_params)

    respond_to do |format|
      if @timeframe.save
        format.html { redirect_to @timeframe, notice: 'Timeframe was successfully created.' }
        format.json { render json: @timeframe, status: :created, location: @timeframe }
      else
        format.html { render action: "new" }
        format.json { render json: @timeframe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timeframes/1
  # PATCH/PUT /timeframes/1.json
  def update
    @timeframe = Timeframe.find(params[:id])

    respond_to do |format|
      if @timeframe.update_attributes(timeframe_params)
        format.html { redirect_to @timeframe, notice: 'Timeframe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @timeframe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timeframes/1
  # DELETE /timeframes/1.json
  def destroy
    @timeframe = Timeframe.find(params[:id])
    @timeframe.destroy

    respond_to do |format|
      format.html { redirect_to timeframes_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def timeframe_params
      params.require(:timeframe).permit(:type_limit, :value)
    end
end
