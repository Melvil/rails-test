class VacanciesController < ApplicationController
  # GET /vacancies
  # GET /vacancies.json
  def index
    @vacancies = Vacancy.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vacancies }
    end
  end

  # GET /vacancies/1
  # GET /vacancies/1.json
  def show
    @vacancy = Vacancy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vacancy }
    end
  end

  # GET /vacancies/new
  # GET /vacancies/new.json
  def new
    @vacancy = Vacancy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vacancy }
    end
  end

  # GET /vacancies/1/edit
  def edit
    @vacancy = Vacancy.find(params[:id])
  end

  # POST /vacancies
  # POST /vacancies.json
  def create
    @vacancy = Vacancy.new(params[:vacancy])

    respond_to do |format|
      if @vacancy.save
        format.html { redirect_to @vacancy, notice: 'Vacancy was successfully created.' }
        format.json { render json: @vacancy, status: :created, location: @vacancy }
      else
        format.html { render action: "new" }
        format.json { render json: @vacancy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vacancies/1
  # PUT /vacancies/1.json
  def update
    @vacancy = Vacancy.find(params[:id])

    respond_to do |format|
      if @vacancy.update_attributes(params[:vacancy])
        format.html { redirect_to @vacancy, notice: 'Vacancy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vacancy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacancies/1
  # DELETE /vacancies/1.json
  def destroy
    @vacancy = Vacancy.find(params[:id])
    @vacancy.destroy

    respond_to do |format|
      format.html { redirect_to vacancies_url }
      format.json { head :no_content }
    end
  end

  def ability_add
    @vacancy = Vacancy.find(params[:id])

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
      if @vacancy.abilities << @ability
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
    @vacancy = Vacancy.find(params[:id])
    @ability = Ability.find(params[:ability_id])

    respond_to do |format|
      if @vacancy.abilities.delete(@ability)
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
