/** Definitions related to `java.util.stream`. */

private import semmle.code.java.dataflow.ExternalFlow

private class StreamModel extends SummaryModelCsv {
  override predicate row(string s) {
    s =
      [
        "java.util.stream;BaseStream;true;iterator;();;Argument[-1].Element;ReturnValue.Element;value",
        "java.util.stream;BaseStream;true;onClose;(Runnable);;Argument[-1].Element;ReturnValue.Element;value",
        "java.util.stream;BaseStream;true;parallel;();;Argument[-1].Element;ReturnValue.Element;value",
        "java.util.stream;BaseStream;true;sequential;();;Argument[-1].Element;ReturnValue.Element;value",
        "java.util.stream;BaseStream;true;spliterator;();;Argument[-1].Element;ReturnValue.Element;value",
        "java.util.stream;BaseStream;true;unordered;();;Argument[-1].Element;ReturnValue.Element;value",
        "java.util.stream;Stream;true;allMatch;(Predicate);;Argument[-1].Element;Argument[0].Parameter[0];value",
        "java.util.stream;Stream;true;anyMatch;(Predicate);;Argument[-1].Element;Argument[0].Parameter[0];value",
        "java.util.stream;Stream;true;collect;(Supplier,BiConsumer,BiConsumer);;Argument[0].ReturnValue;Argument[1].Parameter[0];value",
        "java.util.stream;Stream;true;collect;(Supplier,BiConsumer,BiConsumer);;Argument[1].Parameter[0];ReturnValue;value",
        "java.util.stream;Stream;true;collect;(Supplier,BiConsumer,BiConsumer);;Argument[1].Parameter[0];Argument[2].Parameter[0..1];value",
        "java.util.stream;Stream;true;collect;(Supplier,BiConsumer,BiConsumer);;Argument[2].Parameter[0..1];Argument[1].Parameter[0];value",
        "java.util.stream;Stream;true;collect;(Supplier,BiConsumer,BiConsumer);;Argument[-1].Element;Argument[1].Parameter[1];value",
        // Missing: collect(Collector<T,A,R> collector)
        "java.util.stream;Stream;true;concat;(Stream,Stream);;Argument[0..1].Element;ReturnValue.Element;value",
        "java.util.stream;Stream;true;distinct;();;Argument[-1].Element;ReturnValue.Element;value",
        "java.util.stream;Stream;true;dropWhile;(Predicate);;Argument[-1].Element;Argument[0].Parameter[0];value",
        "java.util.stream;Stream;true;dropWhile;(Predicate);;Argument[-1].Element;ReturnValue.Element;value",
        "java.util.stream;Stream;true;filter;(Predicate);;Argument[-1].Element;Argument[0].Parameter[0];value",
        "java.util.stream;Stream;true;filter;(Predicate);;Argument[-1].Element;ReturnValue.Element;value",
        "java.util.stream;Stream;true;findAny;();;Argument[-1].Element;ReturnValue.Element;value",
        "java.util.stream;Stream;true;findFirst;();;Argument[-1].Element;ReturnValue.Element;value",
        "java.util.stream;Stream;true;flatMap;(Function);;Argument[-1].Element;Argument[0].Parameter[0];value",
        "java.util.stream;Stream;true;flatMap;(Function);;Argument[0].ReturnValue.Element;ReturnValue.Element;value",
        "java.util.stream;Stream;true;flatMapToDouble;(Function);;Argument[-1].Element;Argument[0].Parameter[0];value",
        "java.util.stream;Stream;true;flatMapToInt;(Function);;Argument[-1].Element;Argument[0].Parameter[0];value",
        "java.util.stream;Stream;true;flatMapToLong;(Function);;Argument[-1].Element;Argument[0].Parameter[0];value",
        "java.util.stream;Stream;true;forEach;(Consumer);;Argument[-1].Element;Argument[0].Parameter[0];value",
        "java.util.stream;Stream;true;forEachOrdered;(Consumer);;Argument[-1].Element;Argument[0].Parameter[0];value",
        "java.util.stream;Stream;true;generate;(Supplier);;Argument[0].ReturnValue;ReturnValue.Element;value",
        "java.util.stream;Stream;true;iterate;(Object,Predicate,UnaryOperator);;Argument[0];ReturnValue.Element;value",
        "java.util.stream;Stream;true;iterate;(Object,Predicate,UnaryOperator);;Argument[0];Argument[1..2].Parameter[0];value",
        "java.util.stream;Stream;true;iterate;(Object,Predicate,UnaryOperator);;Argument[2].ReturnValue;ReturnValue.Element;value",
        "java.util.stream;Stream;true;iterate;(Object,Predicate,UnaryOperator);;Argument[2].ReturnValue;Argument[1..2].Parameter[0];value",
        "java.util.stream;Stream;true;iterate;(Object,UnaryOperator);;Argument[0];ReturnValue.Element;value",
        "java.util.stream;Stream;true;iterate;(Object,UnaryOperator);;Argument[0];Argument[1].Parameter[0];value",
        "java.util.stream;Stream;true;iterate;(Object,UnaryOperator);;Argument[1].ReturnValue;ReturnValue.Element;value",
        "java.util.stream;Stream;true;iterate;(Object,UnaryOperator);;Argument[1].ReturnValue;Argument[1].Parameter[0];value",
        "java.util.stream;Stream;true;limit;(long);;Argument[-1].Element;ReturnValue.Element;value",
        "java.util.stream;Stream;true;map;(Function);;Argument[-1].Element;Argument[0].Parameter[0];value",
        "java.util.stream;Stream;true;map;(Function);;Argument[0].ReturnValue;ReturnValue.Element;value",
        // Missing for mapMulti(BiConsumer) (not currently supported):
        // Argument[0] of Parameter[1] of Argument[0] -> Element of Parameter[1] of Argument[0]
        // Element of Parameter[1] of Argument[0] -> Element of ReturnValue
        "java.util.stream;Stream;true;mapMulti;(BiConsumer);;Argument[-1].Element;Argument[0].Parameter[0];value",
        "java.util.stream;Stream;true;mapMultiToDouble;(BiConsumer);;Argument[-1].Element;Argument[0].Parameter[0];value",
        "java.util.stream;Stream;true;mapMultiToInt;(BiConsumer);;Argument[-1].Element;Argument[0].Parameter[0];value",
        "java.util.stream;Stream;true;mapMultiToLong;(BiConsumer);;Argument[-1].Element;Argument[0].Parameter[0];value",
        "java.util.stream;Stream;true;mapToDouble;(ToDoubleFunction);;Argument[-1].Element;Argument[0].Parameter[0];value",
        "java.util.stream;Stream;true;mapToInt;(ToIntFunction);;Argument[-1].Element;Argument[0].Parameter[0];value",
        "java.util.stream;Stream;true;mapToLong;(ToLongFunction);;Argument[-1].Element;Argument[0].Parameter[0];value",
        "java.util.stream;Stream;true;max;(Comparator);;Argument[-1].Element;ReturnValue.Element;value",
        "java.util.stream;Stream;true;max;(Comparator);;Argument[-1].Element;Argument[0].Parameter[0..1];value",
        "java.util.stream;Stream;true;min;(Comparator);;Argument[-1].Element;ReturnValue.Element;value",
        "java.util.stream;Stream;true;min;(Comparator);;Argument[-1].Element;Argument[0].Parameter[0..1];value",
        "java.util.stream;Stream;true;noneMatch;(Predicate);;Argument[-1].Element;Argument[0].Parameter[0];value",
        "java.util.stream;Stream;true;of;(Object);;Argument[0];ReturnValue.Element;value",
        "java.util.stream;Stream;true;of;(Object[]);;Argument[0].ArrayElement;ReturnValue.Element;value",
        "java.util.stream;Stream;true;ofNullable;(Object);;Argument[0];ReturnValue.Element;value",
        "java.util.stream;Stream;true;peek;(Consumer);;Argument[-1].Element;Argument[0].Parameter[0];value",
        "java.util.stream;Stream;true;peek;(Consumer);;Argument[-1].Element;ReturnValue.Element;value",
        "java.util.stream;Stream;true;reduce;(BinaryOperator);;Argument[-1].Element;Argument[0].Parameter[0..1];value",
        "java.util.stream;Stream;true;reduce;(BinaryOperator);;Argument[-1].Element;ReturnValue.Element;value",
        "java.util.stream;Stream;true;reduce;(BinaryOperator);;Argument[0].ReturnValue;Argument[0].Parameter[0..1];value",
        "java.util.stream;Stream;true;reduce;(BinaryOperator);;Argument[0].ReturnValue;ReturnValue.Element;value",
        "java.util.stream;Stream;true;reduce;(Object,BinaryOperator);;Argument[-1].Element;Argument[1].Parameter[0..1];value",
        "java.util.stream;Stream;true;reduce;(Object,BinaryOperator);;Argument[0];Argument[1].Parameter[0..1];value",
        "java.util.stream;Stream;true;reduce;(Object,BinaryOperator);;Argument[0];ReturnValue;value",
        "java.util.stream;Stream;true;reduce;(Object,BinaryOperator);;Argument[1].ReturnValue;Argument[1].Parameter[0..1];value",
        "java.util.stream;Stream;true;reduce;(Object,BinaryOperator);;Argument[1].ReturnValue;ReturnValue;value",
        "java.util.stream;Stream;true;reduce;(Object,BiFunction,BinaryOperator);;Argument[-1].Element;Argument[1].Parameter[1];value",
        "java.util.stream;Stream;true;reduce;(Object,BiFunction,BinaryOperator);;Argument[0];Argument[1].Parameter[0];value",
        "java.util.stream;Stream;true;reduce;(Object,BiFunction,BinaryOperator);;Argument[0];Argument[2].Parameter[0..1];value",
        "java.util.stream;Stream;true;reduce;(Object,BiFunction,BinaryOperator);;Argument[0];ReturnValue;value",
        "java.util.stream;Stream;true;reduce;(Object,BiFunction,BinaryOperator);;Argument[1..2].ReturnValue;Argument[1].Parameter[0];value",
        "java.util.stream;Stream;true;reduce;(Object,BiFunction,BinaryOperator);;Argument[1..2].ReturnValue;Argument[2].Parameter[0..1];value",
        "java.util.stream;Stream;true;reduce;(Object,BiFunction,BinaryOperator);;Argument[1..2].ReturnValue;ReturnValue;value",
        "java.util.stream;Stream;true;skip;(long);;Argument[-1].Element;ReturnValue.Element;value",
        "java.util.stream;Stream;true;sorted;;;Argument[-1].Element;ReturnValue.Element;value",
        "java.util.stream;Stream;true;sorted;(Comparator);;Argument[-1].Element;Argument[0].Parameter[0..1];value",
        "java.util.stream;Stream;true;takeWhile;(Predicate);;Argument[-1].Element;Argument[0].Parameter[0];value",
        "java.util.stream;Stream;true;takeWhile;(Predicate);;Argument[-1].Element;ReturnValue.Element;value",
        "java.util.stream;Stream;true;toArray;;;Argument[-1].Element;ReturnValue.ArrayElement;value",
        "java.util.stream;Stream;true;toList;();;Argument[-1].Element;ReturnValue.Element;value"
      ]
  }
}
