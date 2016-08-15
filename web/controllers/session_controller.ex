defmodule SessionController do
  use HelloPhoenix.Web, :controller

  def new(conn, params) do

  end

  def create(conn, params) do
    case User.find_and_confirm_password(params) do
      {:ok, user} ->
        conn
        |> Guardian.Plug.sign_in(user)
        |> redirect(to: "/")
      {:error, changeset} ->
        render conn, "login.html", changeset: changeset
    end
  end

  def destroy(conn, _params) do
    conn
    |> Guardian.Plug.sign_out
    |> put_flash(:info, "Logged out")
    |> redirect(to: "/")
  end
end
