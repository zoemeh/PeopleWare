class SessionsController < Clearance::SessionsController
  def sign_in_candidate
  end

  def do_sign_in_candidate
    @candidate = Candidate.find_by_cedula(params[:cedula])
    if @candidate.nil?
      redirect_to sign_in_candidate_url, notice: "Usuario no encontrado"
    else
      sign_in(@candidate.user)
      redirect_to profile_index_url
    end
  end
end