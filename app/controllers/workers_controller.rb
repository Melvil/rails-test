class WorkersController < ApplicationController
  # GET /workers
  # GET /workers.json
  def index
    @workers = Worker.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workers }
    end
  end

  # GET /workers/1
  # GET /workers/1.json
  def show
    @worker = Worker.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @worker }
    end
  end

  # GET /workers/new
  # GET /workers/new.json
  def new
    @worker = Worker.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @worker }
    end
  end

  # GET /workers/1/edit
  def edit
    @worker = Worker.find(params[:id])
  end

  # POST /workers
  # POST /workers.json
  def create
    @worker = Worker.new(params[:worker])

    respond_to do |format|
      if @worker.save
        format.html { redirect_to @worker, notice: 'Worker was successfully created.' }
        format.json { render json: @worker, status: :created, location: @worker }
      else
        format.html { render action: "new" }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /workers/1
  # PUT /workers/1.json
  def update
    @worker = Worker.find(params[:id])

    respond_to do |format|
      if @worker.update_attributes(params[:worker])
        format.html { redirect_to @worker, notice: 'Worker was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workers/1
  # DELETE /workers/1.json
  def destroy
    @worker = Worker.find(params[:id])
    @worker.destroy

    respond_to do |format|
      format.html { redirect_to workers_url }
      format.json { head :no_content }
    end
  end

  def ability_add
    @worker = Worker.find(params[:id])

    if (params['AbilitySelect']['id'])
      @ability = Ability.find(params['AbilitySelect']['id'])
    else
      if (params['AbilitySelect']['name'])
        @ability = Ability.find_by_name(params['AbilitySelect']['name'])
        if !@ability
          @ability = Ability.new(:name => params['AbilitySelect']['name'])
          @ability.save
        end
      else
        @ability = nil
      end
    end

    respond_to do |format|
      if @worker.abilities << @ability
        format.html { redirect_to action: "show" }
        format.json { render json: @ability, status: :success }
        format.js { render "abilities/add_rel" }
      else
        format.html { redirect_to action: "show" }
        format.json { render json: @ability, status: :error }
        format.js { render :nothing => true }
      end
    end
  end

  def ability_delete
    @worker = Worker.find(params[:id])
    @ability = Ability.find(params[:ability_id])

    respond_to do |format|
      if @worker.abilities.delete(@ability)
        format.html { redirect_to action: "show" }
        format.json { render json: @ability, status: :success }
        format.js { render "abilities/delete_rel" }
      else
        format.html { redirect_to action: "show" }
        format.json { render json: @ability, status: :error }
        format.js { render :nothing => true }
      end
    end
  end
end
