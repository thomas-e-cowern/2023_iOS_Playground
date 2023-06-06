# ``Atomics/AtomicOptionalReferenceStorage``

## Topics

### Creating and Disposing Atomic Storage

- ``init(_:)``
- ``dispose()``

### Atomic Operations

- ``atomicLoad(at:ordering:)``
- ``atomicStore(_:at:ordering:)``
- ``atomicExchange(_:at:ordering:)``
- ``atomicCompareExchange(expected:desired:at:ordering:)``
- ``atomicCompareExchange(expected:desired:at:successOrdering:failureOrdering:)``
- ``atomicWeakCompareExchange(expected:desired:at:successOrdering:failureOrdering:)``
