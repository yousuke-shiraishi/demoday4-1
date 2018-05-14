class MembersController < ApplicationController

  def search
    if params[:public]
      @member = Member.where('name = ? AND birth = ?', params[:name], params[:birth])
      @gmaps = @member.joins(:gmaps).where('magic_word = ?', '').map { |member| member.gmaps }.flatten.uniq
      render template: 'gmaps/index'
    else
      @gmaps = Gmap.joins(:member).where('magic_word = ? AND magic_word != ? AND email = ?' ,params[:magic_word] ,"",params[:email])
      render template: 'gmaps/index'
    end
  end

  def downloadpdf
    file_name = 'gmapsの理念.pdf'
    filepath = Rails.root.join('public', file_name)
    stat = File.stat(filepath)
    send_file(filepath, filename: file_name, length: stat.size)
  end

  def dispatching
    if member_signed_in?
      redirect_to new_gmap_path
    else
      redirect_to new_member_session_path
    end
  end

end
