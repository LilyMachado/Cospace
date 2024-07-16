class BookingsController < ApplicationController
  # This before_action ensures that the set_booking method is called before
  # the show, edit, update, remove, notifications, status, and notify actions.
  before_action :set_booking, only: [:show, :edit, :update, :remove, :notifications, :status, :notify]

  # The index action retrieves all bookings from the database and stores them in the @bookings instance variable.
  # This instance variable is then accessible in the index view.
  def index
    @bookings = Booking.all
  end

  # The show action is used to display a single booking.
  # The @booking instance variable is set by the set_booking method.
  def show
  end

  # The new action initializes a new Booking object and stores it in the @booking instance variable.
  # This instance variable is used in the new view to render a form for creating a new booking.
  def new
    @booking = Booking.new
  end

  # The create action handles the form submission for creating a new booking.
  # It initializes a new Booking object with the parameters from the form, associates the current user with the booking,
  # and tries to save it to the database.
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user  # Set the current user for the booking

    if @booking.save
      # If the booking is successfully saved, send a notification email to the user
      NotificationMailer.booking_request(@booking).deliver_now
      # Redirect to the booking's show page with a success notice
      redirect_to @booking, notice: 'Booking was successfully created.'
    else
      # If the save fails, re-render the new form
      render :new
    end
  end

  # The edit action is used to render a form for editing an existing booking.
  # The @booking instance variable is set by the set_booking method.
  def edit
  end

  # The update action handles the form submission for updating an existing booking.
  # It tries to update the booking with the parameters from the form.
  def update
    if @booking.update(booking_params)
      # If the booking is successfully updated, send a notification email to the user
      NotificationMailer.booking_update(@booking).deliver_now
      # Redirect to the booking's show page with a success notice
      redirect_to @booking, notice: 'Booking was successfully updated.'
    else
      # If the update fails, re-render the edit form
      render :edit
    end
  end

  # The remove action deletes a booking from the database.
  # After deletion, it redirects to the bookings index page with a success notice.
  def remove
    @booking.destroy
    redirect_to bookings_url, notice: 'Booking was successfully removed.'
  end

  # The notifications action retrieves the details of a booking request.
  # The @booking instance variable is set by the set_booking method.
  def notifications
    # Assuming @booking has a method to fetch notifications
  end

  # The status action allows the owner to accept or decline a booking request.
  # It updates the booking's status based on the user's input.
  def status
    if params[:accept]
      @booking.update(status: 'accepted')
    else
      @booking.update(status: 'declined')
    end
    # Redirect to the notify action to inform the user about the decision
    redirect_to notify_booking_path(@booking)
  end

  # The notify action is used to notify the user about the status change of their booking request.
  def notify
    # Logic to notify the user about the status change
    # e.g., sending an email or updating a notification system
  end

  private

  # The set_booking method finds a booking by its id parameter and assigns it to the @booking variable.
  # This method is used by the before_action filter to set the @booking variable before the show, edit, update, remove,
  # notifications, status, and notify actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # The booking_params method specifies the allowed parameters for a booking.
  # It ensures that only the workspace_id, start_time, end_time, and status parameters are permitted
  # when creating or updating a booking. This helps prevent mass-assignment vulnerabilities.
  def booking_params
    params.require(:booking).permit(:workspace_id, :start_time, :end_time, :status)
  end
end
