"""
Map from CKR return codes to Python exceptions.
"""

from .exceptions import *

cdef ERROR_MAP = {
    CKR_ATTRIBUTE_TYPE_INVALID: AttributeTypeInvalid,
    CKR_ATTRIBUTE_VALUE_INVALID: AttributeValueInvalid,
    CKR_ATTRIBUTE_READ_ONLY: AttributeReadOnly,
    CKR_ATTRIBUTE_SENSITIVE: AttributeSensitive,
    CKR_ARGUMENTS_BAD: ArgumentsBad,
    CKR_BUFFER_TOO_SMALL: MemoryError("Buffer was too small. Should never see this."),
    CKR_CRYPTOKI_ALREADY_INITIALIZED: RuntimeError("Initialisation error (already initialized). Should never see this."),
    CKR_CRYPTOKI_NOT_INITIALIZED: RuntimeError("Initialisation error (not initialized). Should never see this."),
    CKR_DATA_INVALID: DataInvalid,
    CKR_DATA_LEN_RANGE: DataLenRange,
    CKR_DOMAIN_PARAMS_INVALID: DomainParamsInvalid,
    CKR_DEVICE_ERROR: DeviceError,
    CKR_DEVICE_MEMORY: DeviceMemory,
    CKR_DEVICE_REMOVED: DeviceRemoved,
    CKR_ENCRYPTED_DATA_INVALID: EncryptedDataInvalid,
    CKR_ENCRYPTED_DATA_LEN_RANGE: EncryptedDataLenRange,
    CKR_EXCEEDED_MAX_ITERATIONS: ExceededMaxIterations,
    CKR_FUNCTION_CANCELED: FunctionCancelled,
    CKR_FUNCTION_FAILED: FunctionFailed,
    CKR_FUNCTION_REJECTED: FunctionRejected,
    CKR_FUNCTION_NOT_SUPPORTED: FunctionNotSupported,
    CKR_KEY_HANDLE_INVALID: KeyHandleInvalid,
    CKR_KEY_INDIGESTIBLE: KeyIndigestible,
    CKR_KEY_NEEDED: KeyNeeded,
    CKR_KEY_NOT_NEEDED: KeyNotNeeded,
    CKR_KEY_SIZE_RANGE: KeySizeRange,
    CKR_KEY_NOT_WRAPPABLE: KeyNotWrappable,
    CKR_KEY_TYPE_INCONSISTENT: KeyTypeInconsistent,
    CKR_KEY_UNEXTRACTABLE: KeyUnextractable,
    CKR_GENERAL_ERROR: GeneralError,
    CKR_HOST_MEMORY: HostMemory,
    CKR_MECHANISM_INVALID: MechanismInvalid,
    CKR_MECHANISM_PARAM_INVALID: MechanismParamInvalid,
    CKR_OBJECT_HANDLE_INVALID: ObjectHandleInvalid,
    CKR_OPERATION_ACTIVE: OperationActive,
    CKR_OPERATION_NOT_INITIALIZED: OperationNotInitialized,
    CKR_PIN_EXPIRED: PinExpired,
    CKR_PIN_INCORRECT: PinIncorrect,
    CKR_PIN_INVALID: PinInvalid,
    CKR_PIN_LOCKED: PinLocked,
    CKR_PIN_TOO_WEAK: PinTooWeak,
    CKR_PUBLIC_KEY_INVALID: PublicKeyInvalid,
    CKR_RANDOM_NO_RNG: RandomNoRNG,
    CKR_RANDOM_SEED_NOT_SUPPORTED: RandomSeedNotSupported,
    CKR_SESSION_CLOSED: SessionClosed,
    CKR_SESSION_COUNT: SessionCount,
    CKR_SESSION_EXISTS: SessionExists,
    CKR_SESSION_HANDLE_INVALID: SessionHandleInvalid,
    CKR_SESSION_PARALLEL_NOT_SUPPORTED: RuntimeError("Parallel not supported. Should never see this."),
    CKR_SESSION_READ_ONLY: SessionReadOnly,
    CKR_SESSION_READ_ONLY_EXISTS: SessionReadOnlyExists,
    CKR_SESSION_READ_WRITE_SO_EXISTS: SessionReadWriteSOExists,
    CKR_SIGNATURE_LEN_RANGE: SignatureLenRange,
    CKR_SIGNATURE_INVALID: SignatureInvalid,
    CKR_TEMPLATE_INCOMPLETE: TemplateIncomplete,
    CKR_TEMPLATE_INCONSISTENT: TemplateInconsistent,
    CKR_SLOT_ID_INVALID: SlotIDInvalid,
    CKR_TOKEN_NOT_PRESENT: TokenNotPresent,
    CKR_TOKEN_NOT_RECOGNIZED: TokenNotRecognised,
    CKR_TOKEN_WRITE_PROTECTED: TokenWriteProtected,
    CKR_UNWRAPPING_KEY_HANDLE_INVALID: UnwrappingKeyHandleInvalid,
    CKR_UNWRAPPING_KEY_SIZE_RANGE: UnwrappingKeySizeRange,
    CKR_UNWRAPPING_KEY_TYPE_INCONSISTENT: UnwrappingKeyTypeInconsistent,
    CKR_USER_NOT_LOGGED_IN: UserNotLoggedIn,
    CKR_USER_ALREADY_LOGGED_IN: UserAlreadyLoggedIn,
    CKR_USER_ANOTHER_ALREADY_LOGGED_IN: AnotherUserAlreadyLoggedIn,
    CKR_USER_PIN_NOT_INITIALIZED: UserPinNotInitialized,
    CKR_USER_TOO_MANY_TYPES: UserTooManyTypes,
    CKR_USER_TYPE_INVALID: RuntimeError("User type invalid. Should never see this."),
    CKR_WRAPPED_KEY_INVALID: WrappedKeyInvalid,
    CKR_WRAPPED_KEY_LEN_RANGE: WrappedKeyLenRange,
    CKR_WRAPPING_KEY_HANDLE_INVALID: WrappingKeyHandleInvalid,
    CKR_WRAPPING_KEY_SIZE_RANGE: WrappingKeySizeRange,
    CKR_WRAPPING_KEY_TYPE_INCONSISTENT: WrappingKeyTypeInconsistent,
}


cpdef void assertRV(CK_RV rv) except *:
    """Check for an acceptable RV value or thrown an exception."""
    if rv != CKR_OK:
        raise ERROR_MAP.get(rv,
                            PKCS11Error("Unmapped error code %s" % hex(rv)))
