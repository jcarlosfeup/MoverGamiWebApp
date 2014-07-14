class StatsController < ApplicationController
  # GET /stats
  # GET /stats.json
  def index
    @users = User.all
    @stats = Stat.all

    @stats_json = @stats.map{ |e| {:stat => e}}

   respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stats_json }
    end
  end

  def build__daily_array_values(array_daily,activity,feature)
    arr = []
    for i in 0..23
      arr[i] = array_daily[i.to_s][activity][feature]
    end
    
    return arr
  end

  def dailyGraphs(array_daily,type)
    
    #array argument comes from params[:stat][:daily]
    if type == "distance"

      @chart = LazyHighCharts::HighChart.new('graph') do |f|
        f.title(:text => "Daily Distance Traveled")
        f.xAxis(:categories => ["0", "1", "2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23"])
        f.series(:name => "Looking at Phone", :yAxis => 0, :data => build__daily_array_values(array_daily,"lookingAtPhone","distanceTraveled"))
        f.series(:name => "Walking", :yAxis => 0, :data => build__daily_array_values(array_daily,"walking","distanceTraveled"))
        f.series(:name => "Cycling", :yAxis => 0, :data => build__daily_array_values(array_daily,"cycling","distanceTraveled"))
        f.series(:name => "Standing", :yAxis => 0, :data => build__daily_array_values(array_daily,"standing","distanceTraveled"))
        f.series(:name => "Running", :yAxis => 0, :data => build__daily_array_values(array_daily,"running","distanceTraveled"))

        f.yAxis [
          {:title => {:text => "Meters Traveled", :margin => 70} },
        ]

        f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
        f.chart({:defaultSeriesType=>"line"})
      end

    elsif type == "energy"

      @chart = LazyHighCharts::HighChart.new('graph') do |f|
        f.title(:text => "Daily Energy Expanded")
        f.xAxis(:categories => ["0", "1", "2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23"])
        f.series(:name => "Looking at Phone", :yAxis => 0, :data => build__daily_array_values(array_daily,"lookingAtPhone","energy"))
        f.series(:name => "Walking", :yAxis => 0, :data => build__daily_array_values(array_daily,"walking","energy"))
        f.series(:name => "Cycling", :yAxis => 0, :data => build__daily_array_values(array_daily,"cycling","energy"))
        f.series(:name => "Standing", :yAxis => 0, :data => build__daily_array_values(array_daily,"standing","energy"))
        f.series(:name => "Running", :yAxis => 0, :data => build__daily_array_values(array_daily,"running","energy"))
        f.series(:name => "Sitting", :yAxis => 0, :data => build__daily_array_values(array_daily,"sitting","energy"))
        f.series(:name => "Tilting", :yAxis => 0, :data => build__daily_array_values(array_daily,"tilting","energy"))
        f.series(:name => "Not using phone", :yAxis => 0, :data => build__daily_array_values(array_daily,"notUsingPhone","energy"))
        f.series(:name => "Laying", :yAxis => 0, :data => build__daily_array_values(array_daily,"laying","energy"))

        f.yAxis [
          {:title => {:text => "Kcal burned", :margin => 70} },
        ]

        f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
        f.chart({:defaultSeriesType=>"line"})
      end

    elsif type == "steps"

      @chart = LazyHighCharts::HighChart.new('graph') do |f|
        f.title(:text => "Daily Steps")
        f.xAxis(:categories => ["0", "1", "2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23"])
        f.series(:name => "Looking at Phone", :yAxis => 0, :data => build__daily_array_values(array_daily,"lookingAtPhone","steps"))
        f.series(:name => "Walking", :yAxis => 0, :data => build__daily_array_values(array_daily,"walking","steps"))
        f.series(:name => "Cycling", :yAxis => 0, :data => build__daily_array_values(array_daily,"cycling","steps"))
        f.series(:name => "Standing", :yAxis => 0, :data => build__daily_array_values(array_daily,"standing","steps"))
        f.series(:name => "Running", :yAxis => 0, :data => build__daily_array_values(array_daily,"running","steps"))

        f.yAxis [
          {:title => {:text => "Number of steps", :margin => 70} },
        ]

        f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
        f.chart({:defaultSeriesType=>"line"})
      end
    end

    return @chart
  end

   def build__weekly_array_values(array_weekly,activity,feature)
    arr = []
    for i in 0..6
      arr[i] = array_weekly[i.to_s][activity][feature]
    end
    
    return arr
  end

  def weeklyGraphs(array_weekly,type)

     if type == "distance"

      @chart = LazyHighCharts::HighChart.new('graph') do |f|
        f.title(:text => "Weekly Distance Traveled")
        f.xAxis(:categories => ["Sunday", "Monday", "Tuesday","Wednesday","Thursday","Friday","Saturday"])
        f.series(:name => "Looking at Phone", :yAxis => 0, :data => build__weekly_array_values(array_weekly,"lookingAtPhone","distanceTraveled"))
        f.series(:name => "Walking", :yAxis => 0, :data => build__weekly_array_values(array_weekly,"walking","distanceTraveled"))
        f.series(:name => "Cycling", :yAxis => 0, :data => build__weekly_array_values(array_weekly,"cycling","distanceTraveled"))
        f.series(:name => "Standing", :yAxis => 0, :data => build__weekly_array_values(array_weekly,"standing","distanceTraveled"))
        f.series(:name => "Running", :yAxis => 0, :data => build__weekly_array_values(array_weekly,"running","distanceTraveled"))

        f.yAxis [
          {:title => {:text => "Meters Traveled", :margin => 70} },
        ]

        f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
        f.chart({:defaultSeriesType=>"line"})
      end
    elsif type == "energy"

      @chart = LazyHighCharts::HighChart.new('graph') do |f|
        f.title(:text => "Weekly Energy Expanded")
        f.xAxis(:categories => ["Sunday", "Monday", "Tuesday","Wednesday","Thursday","Friday","Saturday"])
        f.series(:name => "Looking at Phone", :yAxis => 0, :data => build__weekly_array_values(array_weekly,"lookingAtPhone","energy"))
        f.series(:name => "Walking", :yAxis => 0, :data => build__weekly_array_values(array_weekly,"walking","energy"))
        f.series(:name => "Cycling", :yAxis => 0, :data => build__weekly_array_values(array_weekly,"cycling","energy"))
        f.series(:name => "Standing", :yAxis => 0, :data => build__weekly_array_values(array_weekly,"standing","energy"))
        f.series(:name => "Running", :yAxis => 0, :data => build__weekly_array_values(array_weekly,"running","energy"))
        f.series(:name => "Sitting", :yAxis => 0, :data => build__weekly_array_values(array_weekly,"sitting","energy"))
        f.series(:name => "Tilting", :yAxis => 0, :data => build__weekly_array_values(array_weekly,"tilting","energy"))
        f.series(:name => "Not using phone", :yAxis => 0, :data => build__weekly_array_values(array_weekly,"notUsingPhone","energy"))
        f.series(:name => "Laying", :yAxis => 0, :data => build__weekly_array_values(array_weekly,"laying","energy"))

        f.yAxis [
          {:title => {:text => "Kcal burned", :margin => 70} },
        ]

        f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
        f.chart({:defaultSeriesType=>"line"})
      end
    elsif type == "steps"

      @chart = LazyHighCharts::HighChart.new('graph') do |f|
        f.title(:text => "Weekly Steps")
        f.xAxis(:categories => ["Sunday", "Monday", "Tuesday","Wednesday","Thursday","Friday","Saturday"])
        f.series(:name => "Looking at Phone", :yAxis => 0, :data => build__weekly_array_values(array_weekly,"lookingAtPhone","steps"))
        f.series(:name => "Walking", :yAxis => 0, :data => build__weekly_array_values(array_weekly,"walking","steps"))
        f.series(:name => "Cycling", :yAxis => 0, :data => build__weekly_array_values(array_weekly,"cycling","steps"))
        f.series(:name => "Standing", :yAxis => 0, :data => build__weekly_array_values(array_weekly,"standing","steps"))
        f.series(:name => "Running", :yAxis => 0, :data => build__weekly_array_values(array_weekly,"running","steps"))

        f.yAxis [
          {:title => {:text => "Number of steps", :margin => 70} },
        ]

        f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
        f.chart({:defaultSeriesType=>"line"})
      end

    end



  end

  def build__monthly_array_values(array_monthly,activity,feature)
    arr = []
    for i in 0..30
      arr[i] = array_monthly[i.to_s][activity][feature]
    end
    
    return arr
  end

  def monthlyGraphs(array_monthly,type)

     if type == "distance"

      @chart = LazyHighCharts::HighChart.new('graph') do |f|
        f.title(:text => "Monthly Distance Traveled")
        f.xAxis(:categories => ["0", "1", "2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"])
        f.series(:name => "Looking at Phone", :yAxis => 0, :data => build__monthly_array_values(array_monthly,"lookingAtPhone","distanceTraveled"))
        f.series(:name => "Walking", :yAxis => 0, :data => build__monthly_array_values(array_monthly,"walking","distanceTraveled"))
        f.series(:name => "Cycling", :yAxis => 0, :data => build__monthly_array_values(array_monthly,"cycling","distanceTraveled"))
        f.series(:name => "Standing", :yAxis => 0, :data => build__monthly_array_values(array_monthly,"standing","distanceTraveled"))
        f.series(:name => "Running", :yAxis => 0, :data => build__monthly_array_values(array_monthly,"running","distanceTraveled"))

        f.yAxis [
          {:title => {:text => "Meters Traveled", :margin => 70} },
        ]

        f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
        f.chart({:defaultSeriesType=>"line"})
      end
    elsif type == "energy"

      @chart = LazyHighCharts::HighChart.new('graph') do |f|
        f.title(:text => "Monthly Energy Expanded")
        f.xAxis(:categories => ["0", "1", "2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"])
        f.series(:name => "Looking at Phone", :yAxis => 0, :data => build__monthly_array_values(array_monthly,"lookingAtPhone","energy"))
        f.series(:name => "Walking", :yAxis => 0, :data => build__monthly_array_values(array_monthly,"walking","energy"))
        f.series(:name => "Cycling", :yAxis => 0, :data => build__monthly_array_values(array_monthly,"cycling","energy"))
        f.series(:name => "Standing", :yAxis => 0, :data => build__monthly_array_values(array_monthly,"standing","energy"))
        f.series(:name => "Running", :yAxis => 0, :data => build__monthly_array_values(array_monthly,"running","energy"))
        f.series(:name => "Sitting", :yAxis => 0, :data => build__monthly_array_values(array_monthly,"sitting","energy"))
        f.series(:name => "Tilting", :yAxis => 0, :data => build__monthly_array_values(array_monthly,"tilting","energy"))
        f.series(:name => "Not using phone", :yAxis => 0, :data => build__monthly_array_values(array_monthly,"notUsingPhone","energy"))
        f.series(:name => "Laying", :yAxis => 0, :data => build__monthly_array_values(array_monthly,"laying","energy"))

        f.yAxis [
          {:title => {:text => "Kcal burned", :margin => 70} },
        ]

        f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
        f.chart({:defaultSeriesType=>"line"})
      end
    elsif type == "steps"

      @chart = LazyHighCharts::HighChart.new('graph') do |f|
        f.title(:text => "Monthly Steps")
        f.xAxis(:categories => ["0", "1", "2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"])
        f.series(:name => "Looking at Phone", :yAxis => 0, :data => build__monthly_array_values(array_monthly,"lookingAtPhone","steps"))
        f.series(:name => "Walking", :yAxis => 0, :data => build__monthly_array_values(array_monthly,"walking","steps"))
        f.series(:name => "Cycling", :yAxis => 0, :data => build__monthly_array_values(array_monthly,"cycling","steps"))
        f.series(:name => "Standing", :yAxis => 0, :data => build__monthly_array_values(array_monthly,"standing","steps"))
        f.series(:name => "Running", :yAxis => 0, :data => build__monthly_array_values(array_monthly,"running","steps"))

        f.yAxis [
          {:title => {:text => "Number of steps", :margin => 70} },
        ]

        f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
        f.chart({:defaultSeriesType=>"line"})
      end

    end
  end

  def convertSeconds_to_Hours(time_in_seconds)
      
    mm, ss = time_in_seconds.divmod(60)            
    hh, mm = mm.divmod(60)           
    dd, hh = hh.divmod(24)          
    
    array_time = [hh, mm, ss]

    return array_time
  end

   def build_daily_activity_time_values(array_daily,feature)
    
    arr = []
    total_looking_at_phone = total_walking = total_cycling = total_standing = total_sitting = total_tilting = total_notUsingPhone = total_laying = total_running = 0

    unless array_daily.nil?
      for i in 0..23
        total_looking_at_phone += (array_daily[i.to_s]['lookingAtPhone'][feature]/1000)
        total_walking += (array_daily[i.to_s]['walking'][feature]/1000)
        total_cycling += (array_daily[i.to_s]['cycling'][feature]/1000)
        total_standing += (array_daily[i.to_s]['standing'][feature]/1000)
        total_sitting += (array_daily[i.to_s]['sitting'][feature]/1000)
        total_tilting += (array_daily[i.to_s]['tilting'][feature]/1000)
        total_notUsingPhone += (array_daily[i.to_s]['notUsingPhone'][feature]/1000)
        total_laying += (array_daily[i.to_s]['laying'][feature]/1000)
        total_running += (array_daily[i.to_s]['running'][feature]/1000)
      end
    end
    
    arr_looking = ['Looking At Phone(%dh%d:%ds)' % convertSeconds_to_Hours(total_looking_at_phone),total_looking_at_phone]
    arr_walking = ['Walking(%dh%d:%ds)' % convertSeconds_to_Hours(total_walking),total_walking]
    arr_cycling = ['Cycling(%dh%d:%ds)' % convertSeconds_to_Hours(total_cycling),total_cycling]
    arr_standing = ['Standing(%dh%d:%ds)' % convertSeconds_to_Hours(total_standing),total_standing]
    arr_sitting = ['Sitting(%dh%d:%ds)' % convertSeconds_to_Hours(total_sitting),total_sitting]
    arr_tilting = ['Tilting(%dh%d:%ds)' % convertSeconds_to_Hours(total_tilting),total_tilting]
    arr_notusing = ['Not using phone(%dh%d:%ds)' % convertSeconds_to_Hours(total_notUsingPhone),total_notUsingPhone]
    arr_laying = ['Laying(%dh%d:%ds)' % convertSeconds_to_Hours(total_laying),total_laying]
    arr_running = ['Running(%dh%d:%ds)' % convertSeconds_to_Hours(total_running),total_running]
    arr[0] = arr_looking
    arr[1] = arr_walking
    arr[2] = arr_cycling
    arr[3] = arr_standing
    arr[4] = arr_sitting
    arr[5] = arr_tilting
    arr[6] = arr_notusing
    arr[7] = arr_laying
    arr[8] = arr_running
    
    return arr
  end

  def build_pie_chart(name,stat,data)

    chart = LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 200, 60, 170]} )
      series = {
        :type=> 'pie',
        :name=> stat,
        :data=> data
      }
      f.series(series)
      f.options[:title][:text] = name
      f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'}) 
      f.plot_options(:pie=>{
        :allowPointSelect=>true, 
        :cursor=>"pointer" , 
        :dataLabels=>{
          :enabled=>true,
          :color=>"black",
          :style=>{
            :font=>"13px Trebuchet MS, Verdana, sans-serif"
          }
        }
      })
    end

    return chart
  end

  def build_daily_kcal_burned_values(array_weekly,feature)

      arr_looking = []
      arr_walking = []
      arr_cycling = []
      arr_standing = []
      arr_sitting = []
      arr_tilting = []
      arr_notusing = []
      arr_laying = []
      arr_running = []
      arr = []
      
      unless array_weekly.nil?
        for i in 0..6
          arr_looking[i] = array_weekly[i.to_s]['lookingAtPhone'][feature]
          arr_walking[i] = array_weekly[i.to_s]['walking'][feature]
          arr_cycling[i] = array_weekly[i.to_s]['cycling'][feature]
          arr_standing[i] = array_weekly[i.to_s]['standing'][feature]
          arr_sitting[i] = array_weekly[i.to_s]['sitting'][feature]
          arr_tilting[i] = array_weekly[i.to_s]['tilting'][feature]
          arr_notusing[i] = array_weekly[i.to_s]['notUsingPhone'][feature]
          arr_laying[i] = array_weekly[i.to_s]['laying'][feature]
          arr_running[i] = array_weekly[i.to_s]['running'][feature]

        end
      end
      
      arr.push(arr_looking)
      arr.push(arr_walking)
      arr.push(arr_cycling)
      arr.push(arr_standing)
      arr.push(arr_sitting)
      arr.push(arr_tilting)
      arr.push(arr_laying)
      arr.push(arr_standing)
      arr.push(arr_running)

      return arr
  end

  def build_kcal_burned_columns(name,feature,data)

    stacked_column = LazyHighCharts::HighChart.new('column') do |f|
      f.series(:name=>'Looking At Phone',:data=> data[0])
      f.series(:name=>'Walking',:data=> data[1]) 
      f.series(:name=>'Cycling',:data=> data[2]) 
      f.series(:name=>'Standing',:data=> data[3]) 
      f.series(:name=>'Sitting',:data=> data[4]) 
      f.series(:name=>'Tilting',:data=> data[5]) 
      f.title({ :text=>name})
      
      f.options[:chart][:defaultSeriesType] = "column"
      f.plot_options({:column=>{:stacking=>"percent"}})
    end

    return stacked_column
    
  end


  # GET /stats/1
  # GET /stats/1.json
  def show
    @stat = Stat.find(params[:id])
    @user = User.find(params[:id])
    #@stat = current_user.stat
    
    if (@stat.daily) != 'null'
      daily_arr = JSON.parse(@stat.daily)
      @daily_chart_dist = dailyGraphs(daily_arr,"distance")
      @daily_chart_energ = dailyGraphs(daily_arr,"energy")
      @daily_chart_steps = dailyGraphs(daily_arr,"steps")
      @pie_chart = build_pie_chart("Daily Activity Time","Time in seconds",build_daily_activity_time_values(JSON.parse(@stat.daily),'time'))
    end

    if (@stat.weekly) != 'null'
      weekly_arr = JSON.parse(@stat.weekly)
      @weekly_chart_dist = weeklyGraphs(weekly_arr,"distance")
      @weekly_chart_energ = weeklyGraphs(weekly_arr,"energy")
      @weekly_chart_steps = weeklyGraphs(weekly_arr,"steps")
    end

    if (@stat.monthly) != 'null'
      monthly_arr = JSON.parse(@stat.monthly)
      @monthly_chart_dist = monthlyGraphs(monthly_arr,"distance")
      @monthly_chart_energ = monthlyGraphs(monthly_arr,"energy")
      @monthly_chart_steps = monthlyGraphs(monthly_arr,"steps")
    end

    @stacked_column = build_kcal_burned_columns("Weekly Kcal burned percentage","Kcal",build_daily_kcal_burned_values(JSON.parse(@stat.weekly),'energy'))

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stat }
    end
  end

  # GET /stats/new
  # GET /stats/new.json
  def new
    @stat = Stat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stat }
    end
  end

  # GET /stats/1/edit
  def edit
    @stat = Stat.find(params[:id])
  end

  # POST /stats
  # POST /stats.json
  def create
    
    @user = User.find(params[:stat][:user_web_id])
    j = ActiveSupport::JSON

    if @user.stat
      @stat = Stat.find(params[:stat][:user_web_id])
      @stat.update_attributes(stat_params)
      
      alltime_data = params[:stat][:alltime]
      @stat.alltime = alltime_data.to_json

      unless (params[:stat][:daily]).nil?
        daily_data = params[:stat][:daily]
        @stat.daily = daily_data.to_json
      end

      unless (params[:stat][:weekly]).nil?
        weekly_data = params[:stat][:weekly]
        @stat.weekly = weekly_data.to_json
      end

      unless (params[:stat][:monthly]).nil?
        monthly_data = params[:stat][:monthly]
        @stat.monthly = monthly_data.to_json
      end

      @user.stats_id = @stat.id
      @user.stat = @stat
    else
      @stat = Stat.new(stat_params)
      @stat.id = @user.id
      
      alltime_data = params[:stat][:alltime]
      @stat.alltime = alltime_data.to_json

      unless (params[:stat][:daily]).nil?
        daily_data = params[:stat][:daily]
        @stat.daily = daily_data.to_json
      end

      unless (params[:stat][:weekly]).nil?
        weekly_data = params[:stat][:weekly]
        @stat.weekly = weekly_data.to_json
      end

      unless (params[:stat][:monthly]).nil?
        monthly_data = params[:stat][:monthly]
        @stat.monthly = monthly_data.to_json
      end
     
      @user.stats_id = @stat.id
      @user.stat = @stat

    end

    @user.save

  respond_to do |format|
      if @stat.save
        format.html { redirect_to @stat, notice: 'Stat was successfully created.' }
        format.json { render json: @stat, status: :created, location: @stat }
      else
        format.html { render action: "new" }
        format.json { render json: @stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stats/1
  # PATCH/PUT /stats/1.json
  def update
    @stat = Stat.find(params[:id])

    respond_to do |format|
      if @stat.update_attributes(stat_params)
        format.html { redirect_to @stat, notice: 'Stat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stats/1
  # DELETE /stats/1.json
  def destroy
    @stat = Stat.find(params[:id])
    @stat.destroy

    respond_to do |format|
      format.html { redirect_to stats_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def stat_params
      params.require(:stat).permit(:badgesUnlocked,:challengesCompleted,:factsCompleted,:rewardsUnlocked,:level,:experience,:daily,:weekly,:monthly)
    end
end
