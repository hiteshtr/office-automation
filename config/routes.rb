Automation::Application.routes.draw do

  get "hmms/index"
  get "hmms/leave_apply", :as => :leave
  get "hmms/viewleave", :as => :viewleave
  get "hmms/leaveApproval", :as => :leaveApproval
  get "hmms/leaveApprovalWarden", :as => :leaveApprovalWarden
  get "hmms/leaveInfo", :as => :leaveInfo
  get "hmms/prevLeaveApp", :as => :prevLeaveApp
  get "hmms/prevLeaveAppOther", :as => :prevLeaveAppOther
  get "hmms/leaveSuccessful", :as => :leaveSuccessful
  get "hmms/sentReview", :as => :sentReview
  get "hmms/showNotifications", :as => :showNotifications 
  get "hmms/showNotification", :as => :showNotification
  get "hmms/showLeaveInfoOther", :as => :showLeaveInfoOther
  get "hmms/leaveApprovalOther", :as => :leaveApprovalOther
  get "hmms/sentReviewOther", :as => :sentReviewOther
  get "hmms/showDetailsOther", :as => :showDetailsOther
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  
  match "hmms/update" => "hmms#update", :via => :post
  match "hmms/approveLeave" => "hmms#approveLeave", :as => :approveLeave
  match "hmms/rejectLeave" => "hmms#rejectLeave", :as => :rejectLeave
  match "hmms/approveLeaveWarden" => "hmms#approveLeaveWarden", :as => :approveLeaveWarden
  match "hmms/rejectLeaveWarden" => "hmms#rejectLeaveWarden", :as => :rejectLeaveWarden
  match "hmms/add" => "hmms#add", :via => :post
  match "hmms/getCurrentAcademicSession" => "hmms#getCurrentAcademicSession"
  match "hmms/updateReason" => "hmms#updateReason", :as => :updateReason
  match "hmms/undoLeaveApproval" => "hmms#undoLeaveApproval", :as => :undoLeaveApproval
  match "hmms/showLeaveStatus" => "hmms#showLeaveStatus", :as => :showLeaveStatus
  match "hmms/sendLeaveNotification" => "hmms#sendLeaveNotification", :as => :sendLeaveNotification
  match "hmms/approveLeaveOther" => "hmms#approveLeaveOther", :as => :approveLeaveOther
  match "hmms/rejectLeaveOther" => "hmms#rejectLeaveOther", :as => :rejectLeaveOther
  match "hmms/undoLeaveApprovalOther" => "hmms#undoLeaveApprovalOther", :as => :undoLeaveApprovalOther
  match "hmms/updateReasonOther" => "hmms#updateReasonOther", :as => :updateReasonOther
  match "hmms/sendLeaveNotificationOther" => "hmms#sendLeaveNotificationOther", :as => :sendLeaveNotificationOther
  
  root :to => 'hmms#index'

  resources :hmms
  resources :leave_details
  resources :leave_status_report
  resources :notifications
  resources :users
  resources :sessions
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end