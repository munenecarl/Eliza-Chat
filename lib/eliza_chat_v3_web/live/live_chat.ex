defmodule ElizaChatV3Web.LiveChat do
  use ElizaChatV3Web,:live_view

  def mount(_params, _session, socket) do
    {:ok, assign(assign(socket, :message, ""), :history, [])}
  end

  def render(assigns) do
    ~H"""
    <div class="message-container">
      <%= for {label, message} <- Enum.zip(Stream.cycle(["Question", "Answer"]), @history) do %>
        <p><strong><%= label %>:</strong> <%= message %></p>
      <% end %>
    </div>

    <form phx-submit="submit" class="form-submit">
      <input type="text" name="s" placeholder="Enter message" class="search-bar" />
      <input type="submit" value="Submit" class="submit-button" />
    </form>
    """
  end

  def handle_event("submit", %{"s" => s}, socket) do
    history = socket.assigns.history ++ [s]
    case ElizaChatV3.generate_message(s, history) do
      messages when is_list(messages) ->
        history = history ++ messages
        {:noreply, assign(assign(socket, :message, Enum.join(messages, ", ")), :history, history)}
      {:error, reason} ->
        IO.inspect(reason, label: "Error")
        {:noreply, assign(socket, :message, "An error occurred")}
    end
  end
end
