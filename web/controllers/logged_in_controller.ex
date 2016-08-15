defmodule HelloPhoenix.LoggedInController do
  use HelloPhoenix.Web, :controller

  plug Guardian.Plug.EnsureAuthenticated, handler: __MODULE__

  def logged_in_page(conn, params) do
    user = Guardian.Plug.current_resource(conn)
    render "logged_in_page.html", user: user
  end

  def unanthenticated(conn, params) do
    conn
    |> put_status(401)
    |> put_flash(:alert, "Authentication required")
    |> redirect(to: "/")
  end
end
