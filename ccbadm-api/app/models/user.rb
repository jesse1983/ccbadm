# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(510)      default(""), not null
#  encrypted_password     :string(510)      default(""), not null
#  reset_password_token   :string(510)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(510)
#  last_sign_in_ip        :string(510)
#  group_id               :integer
#  is_admin               :boolean
#  church_id              :integer
#  profile_id             :integer
#  first_name             :string(510)
#  last_name              :string(510)
#

require 'digest/sha1'
class User < ActiveRecord::Base
  # has_paper_trail
  attr_accessor :password
  before_save :before_save

  belongs_to :profile
  has_and_belongs_to_many :skills
  has_many :tokens, -> { where("expire_at > ?",Time.now)}
  has_many :comments
  belongs_to :group
  belongs_to :church
  # Include default devise modules
  # devise  :database_authenticatable,
  #         # ,:registerable
  #         :recoverable,
  #         :rememberable,
  #         :trackable,
  #         :validatable
  #         # ,:confirmable
  #         # ,:lockable
  #         # ,:timeoutable
  #         # ,:omniauthable
  #         # :token_authenticatable
  validates_presence_of :profile_id
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates_presence_of :group_id
  validates_presence_of :church_id
  # validates_presence_of :password, :if=>:password_required?
  # validates_presence_of :password_confirmation, on: :create

  # validates_numericality_of :amount, allow_nil: true


  def name
    "#{self.first_name} #{self.last_name}"
  end


  def all_skills
    if self.profile.is_admin
      Skill.all()
    else
      # self.skills.each{|m| all.push m}
      self.profile.skills
    end
  end

  def grouped_skills
    group = []
    models = self.all_skills().group_by {|s| s[:model] }
    models.each do |key,value|
      group.push({resource: key, can: value.map{|m| m.name}})
    end
    group
  end

  def kick
    self.tokens.delete_all
  end
  def create_token
    self.tokens << Token.new
    self.tokens.last
  end
  # encrypting
  def encrypt
    if self.password.present?
      Digest::SHA1.hexdigest(self.password)
    else 
      self.encrypted_password
    end
  end


  protected
  def before_save
    self.is_admin = self.profile.is_admin
    self.encrypted_password = self.encrypt()
  end
  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end
end
