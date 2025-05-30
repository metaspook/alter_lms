/// Project-wide essential utilities package.
library;

//-- Core Callbacks

/// A function that takes no arguments and returns no result.
/// Commonly used for callbacks with no input or output, such as button presses.
typedef VoidCallback = void Function();

/// A function that takes an argument of type `T` and returns no result.
/// Often used for callbacks that handle changes to a single value, such as onChange handlers.
typedef ValueChanged<T> = void Function(T value);

/// A function that takes no arguments and returns a res
/// ult of type `T`.
/// Useful for deferred computation, like a lazy-loaded value.
typedef ValueGetter<T> = T Function();

/// A function that takes an optional argument of type `T` and returns no result.
/// Useful when you want an optional parameter, e.g., optional callbacks.
typedef OptionalCallback<T> = void Function([T? value]);

/// A function that takes an argument of type `T` and returns no result.
/// Aimed for operations that only require a single input and no return.
typedef ValueSetter<T> = void Function(T value);

/// A function that takes an argument of type `T` and performs an operation without returning a result.
/// Often used for processing or consuming a value.
typedef Consumer<T> = void Function(T value);

/// A function that takes two arguments of types `T` and `U` and performs an operation without returning a result.
/// Commonly used for operations that require two inputs, like handling key-value pairs.
typedef BiConsumer<T, U> = void Function(T value1, U value2);

//-- Transformers and Mapping

/// A function that takes an argument of type `T` and returns a result of type `R`.
/// Useful for transforming data from one type to another.
// typedef Transformer<T, R> = R Function(T input);
typedef ValueSelector<T, R> = R Function(T input);

/// A function that takes two arguments of types `T` and `U` and returns a result of type `R`.
/// Useful for combining two inputs into a single transformed result.
typedef BiFunction<T, U, R> = R Function(T input1, U input2);

/// A function that takes a `List<T>` and returns a transformed `List<R>`.
/// Useful for converting or filtering lists.
typedef ListTransformer<T, R> = List<R> Function(List<T> items);

/// A function that takes an argument of type `T` and returns a nullable result of type `R`.
/// Useful for transformations where the result might be null.
typedef NullableTransformer<T, R> = R? Function(T input);

//-- Asynchronous Operations

/// A function that performs an asynchronous operation and returns a `Future` of type `T`.
/// Commonly used for async tasks like fetching data.
typedef AsyncCallback<T> = Future<T> Function();

/// A function that takes an argument of type `T` and performs an asynchronous operation.
/// Useful for async operations that consume a single input, like saving data.
typedef AsyncConsumer<T> = Future<void> Function(T value);

/// A function that asynchronously processes a `List<T>` without returning a result.
/// Useful for batch processing, like updating multiple records asynchronously.
typedef AsyncListProcessor<T> = Future<void> Function(List<T> items);

/// A function that asynchronously processes an element of type `T` and returns a transformed `Future<R>`.
/// Commonly used for async mapping, like API calls that transform data.
typedef AsyncTransformer<T, R> = Future<R> Function(T input);

/// A function that returns a `Future<List<T>>` asynchronously.
/// Often used for batch data retrieval from an async source.
typedef AsyncListProvider<T> = Future<List<T>> Function();

/// A function that takes no arguments and returns a nullable result of type `T` asynchronously.
/// Useful for generating deferred async values that may be null.
typedef AsyncGenerator<T> = Future<T?> Function();

//-- Conditions and Validation

/// A function that takes a value of type `T` and returns a boolean indicating a condition.
/// Commonly used for filtering or conditional checks.
typedef Predicate<T> = bool Function(T value);

/// A function that takes a nullable value of type `T` and returns a boolean.
/// Useful for handling conditional checks on nullable inputs.
typedef NullablePredicate<T> = bool Function(T? value);

/// A function that takes a parameter of type `T` and returns an optional `String` error message.
/// Useful for simple validation logic, like form input validation.
typedef Validator<T> = String? Function(T value);

/// A function that takes an element of type `T` and asynchronously returns an optional `String` error message.
/// Commonly used for async validation, like checking server constraints.
typedef AsyncValidator<T> = Future<String?> Function(T value);

//-- Value Comparison and Equality

/// A function that takes two values of type `T` and returns an integer indicating their comparison.
/// Often used for sorting lists.
typedef Comparator<T> = int Function(T value1, T value2);

/// A function that takes two values of type `T` and returns a boolean indicating their equality.
/// Useful for custom equality comparisons, such as comparing custom objects.
typedef Equality<T> = bool Function(T value1, T value2);

//-- Data Retrieval and Providers

/// A function that returns a `List<T>`.
/// Commonly used to generate or provide lists of items on demand.
typedef ListProvider<T> = List<T> Function();

/// A function that returns a `Map<K, V>`.
/// Useful for generating maps or dictionary-like structures.
typedef MapProvider<K, V> = Map<K, V> Function();

/// A function that takes an index and returns an element of type `T`.
/// Useful for indexed retrieval in collections.
typedef IndexedValueGetter<T> = T Function(int index);

/// A function that takes an integer index and returns an element of type `T` or `null`.
/// Useful for nullable access in index-based data structures.
typedef IndexedNullableGetter<T> = T? Function(int index);

/// A function that returns a `Stream` of values of type `T`.
/// Useful for real-time data streams or reactive data flows.
typedef StreamProvider<T> = Stream<T> Function();

//-- Utility and Miscellaneous

/// A function that takes an integer `index` and returns a boolean.
/// Often used for index-based checks, like validating list boundaries.
typedef IndexCondition = bool Function(int index);

/// A function that takes a `String` key and returns a value of type `T`.
/// Commonly used for retrieving values from a map-like structure.
typedef MapGetter<T> = T Function(String key);

/// A function that takes a key-value pair and performs an operation.
/// Often used for iterating over maps and applying operations to each entry.
typedef KeyValueConsumer<K, V> = void Function(K key, V value);

/// A function that takes an error message `String` and performs an error-handling operation.
/// Useful for logging or displaying error messages.
typedef ErrorHandler = void Function(String errorMessage);

/// A function that takes an element of type `T` and returns its `String` representation.
/// Common for converting objects to a displayable format.
typedef Stringifier<T> = String Function(T value);

/// A function that combines two values of type `T` into a single value of type `T`.
/// Useful for reducing a list of values to a single result, like summing values.
typedef Reducer<T> = T Function(T value1, T value2);

/// A function that takes a key of type `K` and returns a list of values of type `V`.
/// Useful for multi-map structures where a key maps to multiple values.
typedef MultiMapGetter<K, V> = List<V> Function(K key);

/// A function that takes an input of type `T` and asynchronously returns a `List<R>`.
/// Common for async transformations that output a list, like loading data.
typedef AsyncListTransformer<T, R> = Future<List<R>> Function(T input);

/// Signature of callbacks that have no arguments and return no data, but that
/// return a [Future] to indicate when their work is complete.
///
/// See also:
///
///  * [VoidCallback], a synchronous version of this signature.
///  * [AsyncValueGetter], a signature for asynchronous getters.
///  * [AsyncValueSetter], a signature for asynchronous setters.
// typedef AsyncCallback = Future<void> Function();

/// Signature for callbacks that report that a value has been set and return a
/// [Future] that completes when the value has been saved.
///
/// See also:
///
///  * [ValueSetter], a synchronous version of this signature.
///  * [AsyncValueGetter], the getter equivalent of this signature.
typedef AsyncValueSetter<T> = Future<void> Function(T value);

/// Signature for callbacks that are to asynchronously report a value on demand.
///
/// See also:
///
///  * [ValueGetter], a synchronous version of this signature.
///  * [AsyncValueSetter], the setter equivalent of this signature.
typedef AsyncValueGetter<T> = Future<T> Function();

/// Signature for callbacks that are to swap value record.
typedef ValueSwapper<T> = (T, T) Function((T, T) record);

///
typedef Tasker = Future<void> Function(Future<Object?> Function() task);
