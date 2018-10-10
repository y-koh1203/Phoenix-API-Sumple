defmodule ApiSumpleWeb.SumpleView do
  use ApiSumpleWeb, :view
  alias ApiSumpleWeb.SumpleView

  def render("index.json", %{sumple: sumple}) do
    %{data: render_many(sumple, SumpleView, "sumple.json")}
  end

  def render("show.json", %{sumple: sumple}) do
    %{data: render_one(sumple, SumpleView, "sumple.json")}
  end

  def render("sumple.json", %{sumple: sumple}) do
    %{id: sumple.id,
      title: sumple.title,
      body: sumple.body}
  end
end
