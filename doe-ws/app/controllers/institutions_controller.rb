class InstitutionsController < ApplicationController
  
  #before_filter :authenticate_user!
  
  respond_to :json
  
  # GET /institutions
  # GET /institutions.json
  def index
    @institutions = Institution.order("razao_social")
    #render :json => { :institutions => @institutions }
   render :json => { :institutions => @institutions.as_json(:include => [ :donations ])  }
  end
  
  def institution_by_donation
    donation_preference = params[:preference]
    
    @institutions = Institution.find(:all, :conditions => ["donation_preference LIKE ?", "%#{donation_preference}%"], :order => "razao_social ASC")
   render :json => { :institutions => @institutions.as_json(:include => [:donations])  }
  
  end

  # GET /institutions/1
  # GET /institutions/1.json
  def show
    @institution = Institution.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @institution.to_json(:include => :donations) }
    end
  end

  # GET /institutions/new
  # GET /institutions/new.json
  def new
    @institution = Institution.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @institution }
    end
  end

  # GET /institutions/1/edit
  def edit
    @institution = Institution.find(params[:id])
  end

  # POST /institutions
  # POST /institutions.json
  def create
    @institution = Institution.new(params[:institution])

    respond_to do |format|
      if @institution.save
        format.html { redirect_to @institution, notice: 'Institution was successfully created.' }
        format.json { render json: @institution, status: :created, location: @institution }
      else
        format.html { render action: "new" }
        format.json { render json: @institution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /institutions/1
  # PUT /institutions/1.json
  def update
    @institution = Institution.find(params[:id])

    respond_to do |format|
      if @institution.update_attributes(params[:institution])
        format.html { redirect_to @institution, notice: 'Institution was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @institution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /institutions/1
  # DELETE /institutions/1.json
  def destroy
    @institution = Institution.find(params[:id])
    @institution.destroy

    respond_to do |format|
      format.html { redirect_to institutions_url }
      format.json { head :no_content }
    end
  end
end
