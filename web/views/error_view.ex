defmodule Retro.ErrorView do
  use Retro.Web, :view

  def render("404.html", _assigns) do
    "Page not found"
  end

  def render("400.json", %{description: description, fields: fields}) do
    render(Retro.ErrorView, "error.json", %{
      code: 400,
      description: description,
      fields: fields
    })
  end

  def render("404.json", %{type: type}) do
    render(Retro.ErrorView, "error.json", %{
      code: 404,
      description: type <> " not found.",
      fields: ["id"]
    })
  end

  def render("422.json", %{type: type, fields: fields}) do
    render(Retro.ErrorView, "error.json", %{
      code: 422,
      description: type <> " was understood as JSON but unprocessable.",
      fields: fields
    })
  end

  def render("500.html", _assigns) do
    "Internal server error"
  end

  def render("error.json", %{code: code, description: description, fields: fields}) do
    %{
      code: code,
      description: description,
      fields: fields
    }
  end

  # In case no render clause matches or no
  # template is found, let's render it as 500
  def template_not_found(_template, assigns) do
    render "500.html", assigns
  end
end
