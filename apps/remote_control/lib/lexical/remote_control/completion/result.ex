defmodule Lexical.RemoteControl.Completion.Result do
  defmodule Function do
    defstruct [:argument_names, :arity, :name, :origin, :type, :visibility, :spec]

    def new(%{} = elixir_sense_map) do
      __MODULE__
      |> struct(elixir_sense_map)
      |> Map.put(:argument_names, Map.get(elixir_sense_map, :args_list))
    end
  end

  defmodule Macro do
    defstruct [:argument_names, :arity, :name, :origin, :type, :visibility, :spec]

    def new(%{} = elixir_sense_map) do
      __MODULE__
      |> struct(elixir_sense_map)
      |> Map.put(:argument_names, Map.get(elixir_sense_map, :args_list))
    end
  end

  defmodule Module do
    defstruct [:full_name, :metadata, :name, :summary]

    def new(%{} = elixir_sense_map) do
      struct(__MODULE__, elixir_sense_map)
    end
  end

  defmodule Exception do
    defstruct [:full_name, :metadata, :name, :summary]

    def new(%{} = elixir_sense_map) do
      struct(__MODULE__, elixir_sense_map)
    end
  end

  defmodule Behaviour do
    defstruct [:full_name, :metadata, :name, :summary]

    def new(%{} = elixir_sense_map) do
      struct(__MODULE__, elixir_sense_map)
    end
  end

  defmodule Protocol do
    defstruct [:full_name, :metadata, :name, :summary]

    def new(%{} = elixir_sense_map) do
      struct(__MODULE__, elixir_sense_map)
    end
  end

  defmodule Struct do
    defstruct [:full_name, :metadata, :name, :summary]

    def new(%{} = elixir_sense_map) do
      struct(__MODULE__, elixir_sense_map)
    end
  end

  defmodule ModuleAttribute do
    defstruct [:name]

    def new(%{} = elixir_sense_map) do
      struct(__MODULE__, elixir_sense_map)
    end
  end

  defmodule Typespec do
    defstruct [:args_list, :airty, :doc, :metadata, :name, :signature, :spec]

    def new(%{} = elixir_sense_map) do
      struct(__MODULE__, elixir_sense_map)
    end
  end

  defmodule Variable do
    defstruct [:name]

    def new(%{} = elixir_sense_map) do
      struct(__MODULE__, elixir_sense_map)
    end
  end

  defmodule Snippet do
    defstruct [:detail, :documentation, :filter_text, :kind, :label, :priority, :snippet]

    def new(%{} = elixir_sense_map) do
      struct(__MODULE__, elixir_sense_map)
    end
  end

  def from_elixir_sense(%{type: :module, subtype: nil} = elixir_sense_map) do
    Module.new(elixir_sense_map)
  end

  def from_elixir_sense(%{type: :module, subtype: :behaviour} = elixir_sense_map) do
    Behaviour.new(elixir_sense_map)
  end

  def from_elixir_sense(%{type: :module, subtype: :exception} = elixir_sense_map) do
    Exception.new(elixir_sense_map)
  end

  def from_elixir_sense(%{type: :module, subtype: :struct} = elixir_sense_map) do
    Struct.new(elixir_sense_map)
  end

  def from_elixir_sense(%{type: :module, subtype: :protocol} = elixir_sense_map) do
    Protocol.new(elixir_sense_map)
  end

  def from_elixir_sense(%{type: :function} = elixir_sense_map) do
    Function.new(elixir_sense_map)
  end

  def from_elixir_sense(%{type: :macro} = elixir_sense_map) do
    Macro.new(elixir_sense_map)
  end

  def from_elixir_sense(%{type: :type_spec} = elixir_sense_map) do
    Typespec.new(elixir_sense_map)
  end

  def from_elixir_sense(%{type: :attribute} = elixir_sense_map) do
    ModuleAttribute.new(elixir_sense_map)
  end

  def from_elixir_sense(%{type: :generic, kind: :snippet} = elixir_sense_map) do
    Snippet.new(elixir_sense_map)
  end

  def from_elixir_sense(%{type: :variable} = elixir_sense_map) do
    Variable.new(elixir_sense_map)
  end
end