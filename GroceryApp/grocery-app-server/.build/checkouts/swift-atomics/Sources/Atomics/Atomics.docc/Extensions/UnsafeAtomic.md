# ``Atomics/UnsafeAtomic``

## Topics

### Storage Representation

- ``Storage``

### Initializers

- ``init(at:)``

### Shorthand Methods for Dynamically Allocating Storage

- ``create(_:)``
- ``destroy()``

### Atomic Operations

- ``load(ordering:)``
- ``store(_:ordering:)``
- ``exchange(_:ordering:)``
- ``compareExchange(expected:desired:ordering:)``
- ``compareExchange(expected:desired:successOrdering:failureOrdering:)``
- ``weakCompareExchange(expected:desired:successOrdering:failureOrdering:)``

### Atomic Integer Operations

- ``wrappingIncrement(by:ordering:)``
- ``wrappingDecrement(by:ordering:)``
- ``loadThenWrappingIncrement(by:ordering:)``
- ``loadThenWrappingDecrement(by:ordering:)``
- ``loadThenBitwiseOr(with:ordering:)``
- ``loadThenBitwiseAnd(with:ordering:)``
- ``loadThenBitwiseXor(with:ordering:)``
- ``wrappingIncrementThenLoad(by:ordering:)``
- ``wrappingDecrementThenLoad(by:ordering:)``
- ``bitwiseOrThenLoad(with:ordering:)``
- ``bitwiseAndThenLoad(with:ordering:)``
- ``bitwiseXorThenLoad(with:ordering:)``

### Atomic Boolean Operations

- ``logicalOrThenLoad(with:ordering:)``
- ``logicalAndThenLoad(with:ordering:)``
- ``logicalXorThenLoad(with:ordering:)``
- ``loadThenLogicalOr(with:ordering:)``
- ``loadThenLogicalAnd(with:ordering:)``
- ``loadThenLogicalXor(with:ordering:)``
