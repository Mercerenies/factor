USING: windows.kernel32 windows.ole32 windows.com windows.com.syntax
alien alien.c-types alien.syntax kernel system namespaces math
classes.struct windows.types windows.directx ;
IN: windows.directx.dinput

LIBRARY: dinput

TYPEDEF: DWORD D3DCOLOR ;

STRUCT: DIDEVICEINSTANCEW
    { dwSize          DWORD      }
    { guidInstance    GUID       }
    { guidProduct     GUID       }
    { dwDevType       DWORD      }
    { tszInstanceName WCHAR[260] }
    { tszProductName  WCHAR[260] }
    { guidFFDriver    GUID       }
    { wUsagePage      WORD       }
    { wUsage          WORD       } ;
TYPEDEF: DIDEVICEINSTANCEW* LPDIDEVICEINSTANCEW ;
TYPEDEF: DIDEVICEINSTANCEW* LPCDIDEVICEINSTANCEW ;
UNION-STRUCT: DIACTION-union
    { lptszActionName LPCWSTR }
    { uResIdString    UINT    } ;
STRUCT: DIACTIONW
    { uAppData     UINT_PTR       }
    { dwSemantic   DWORD          }
    { dwFlags      DWORD          }
    { union        DIACTION-union }
    { guidInstance GUID           }
    { dwObjID      DWORD          }
    { dwHow        DWORD          } ;
TYPEDEF: DIACTIONW* LPDIACTIONW ;
TYPEDEF: DIACTIONW* LPCDIACTIONW ;
STRUCT: DIACTIONFORMATW
    { dwSize        DWORD       }
    { dwActionSize  DWORD       }
    { dwDataSize    DWORD       }
    { dwNumActions  DWORD       }
    { rgoAction     LPDIACTIONW }
    { guidActionMap GUID        }
    { dwGenre       DWORD       }
    { dwBufferSize  DWORD       }
    { lAxisMin      LONG        }
    { lAxisMax      LONG        }
    { hInstString   HINSTANCE   }
    { ftTimeStamp   FILETIME    }
    { dwCRC         DWORD       }
    { tszActionMap  WCHAR[260]  } ;
TYPEDEF: DIACTIONFORMATW* LPDIACTIONFORMATW ;
TYPEDEF: DIACTIONFORMATW* LPCDIACTIONFORMATW ;
STRUCT: DICOLORSET
    { dwSize            DWORD    }
    { cTextFore         D3DCOLOR }
    { cTextHighlight    D3DCOLOR }
    { cCalloutLine      D3DCOLOR }
    { cCalloutHighlight D3DCOLOR }
    { cBorder           D3DCOLOR }
    { cControlFill      D3DCOLOR }
    { cHighlightFill    D3DCOLOR }
    { cAreaFill         D3DCOLOR } ;
TYPEDEF: DICOLORSET* LPDICOLORSET ;
TYPEDEF: DICOLORSET* LPCDICOLORSET ;

STRUCT: DICONFIGUREDEVICESPARAMSW
    { dwSize         DWORD             }
    { dwcUsers       DWORD             }
    { lptszUserNames LPWSTR            }
    { dwcFormats     DWORD             }
    { lprgFormats    LPDIACTIONFORMATW }
    { hwnd           HWND              }
    { dics           DICOLORSET        }
    { lpUnkDDSTarget IUnknown*         } ;
TYPEDEF: DICONFIGUREDEVICESPARAMSW* LPDICONFIGUREDEVICESPARAMSW ;
TYPEDEF: DICONFIGUREDEVICESPARAMSW* LPCDICONFIGUREDEVICESPARAMSW ;

STRUCT: DIDEVCAPS
    { dwSize DWORD }
    { dwFlags DWORD }
    { dwDevType DWORD }
    { dwAxes DWORD }
    { dwButtons DWORD }
    { dwPOVs DWORD }
    { dwFFSamplePeriod DWORD }
    { dwFFMinTimeResolution DWORD }
    { dwFirmwareRevision DWORD }
    { dwHardwareRevision DWORD }
    { dwFFDriverVersion DWORD } ;
TYPEDEF: DIDEVCAPS* LPDIDEVCAPS ;
TYPEDEF: DIDEVCAPS* LPCDIDEVCAPS ;
STRUCT: DIDEVICEOBJECTINSTANCEW
    { dwSize DWORD }
    { guidType GUID }
    { dwOfs DWORD }
    { dwType DWORD }
    { dwFlags DWORD }
    { tszName WCHAR[260] }
    { dwFFMaxForce DWORD }
    { dwFFForceResolution DWORD }
    { wCollectionNumber WORD }
    { wDesignatorIndex WORD }
    { wUsagePage WORD }
    { wUsage WORD }
    { dwDimension DWORD }
    { wExponent WORD }
    { wReportId WORD } ;
TYPEDEF: DIDEVICEOBJECTINSTANCEW* LPDIDEVICEOBJECTINSTANCEW ;
TYPEDEF: DIDEVICEOBJECTINSTANCEW* LPCDIDEVICEOBJECTINSTANCEW ;
STRUCT: DIDEVICEOBJECTDATA
    { dwOfs DWORD    }
    { dwData DWORD    }
    { dwTimeStamp DWORD    }
    { dwSequence DWORD    }
    { uAppData UINT_PTR } ;
TYPEDEF: DIDEVICEOBJECTDATA* LPDIDEVICEOBJECTDATA ;
TYPEDEF: DIDEVICEOBJECTDATA* LPCDIDEVICEOBJECTDATA ;
STRUCT: DIOBJECTDATAFORMAT
    { pguid GUID* }
    { dwOfs DWORD }
    { dwType DWORD }
    { dwFlags DWORD } ;
TYPEDEF: DIOBJECTDATAFORMAT* LPDIOBJECTDATAFORMAT ;
TYPEDEF: DIOBJECTDATAFORMAT* LPCDIOBJECTDATAFORMAT ;
STRUCT: DIDATAFORMAT
    { dwSize DWORD }
    { dwObjSize DWORD }
    { dwFlags DWORD }
    { dwDataSize DWORD }
    { dwNumObjs DWORD }
    { rgodf LPDIOBJECTDATAFORMAT } ;
TYPEDEF: DIDATAFORMAT* LPDIDATAFORMAT ;
TYPEDEF: DIDATAFORMAT* LPCDIDATAFORMAT ;
STRUCT: DIPROPHEADER
    { dwSize DWORD }
    { dwHeaderSize DWORD }
    { dwObj DWORD }
    { dwHow DWORD } ;
TYPEDEF: DIPROPHEADER* LPDIPROPHEADER ;
TYPEDEF: DIPROPHEADER* LPCDIPROPHEADER ;
STRUCT: DIPROPDWORD
    { diph DIPROPHEADER }
    { dwData DWORD        } ;
TYPEDEF: DIPROPDWORD* LPDIPROPDWORD ;
TYPEDEF: DIPROPDWORD* LPCDIPROPDWORD ;
STRUCT: DIPROPPOINTER
    { diph DIPROPHEADER }
    { uData UINT_PTR } ;
TYPEDEF: DIPROPPOINTER* LPDIPROPPOINTER ;
TYPEDEF: DIPROPPOINTER* LPCDIPROPPOINTER ;
STRUCT: DIPROPRANGE
    { diph DIPROPHEADER }
    { lMin LONG }
    { lMax LONG } ;
TYPEDEF: DIPROPRANGE* LPDIPROPRANGE ;
TYPEDEF: DIPROPRANGE* LPCDIPROPRANGE ;
STRUCT: DIPROPCAL
    { diph DIPROPHEADER }
    { lMin LONG }
    { lCenter LONG }
    { lMax LONG } ;
TYPEDEF: DIPROPCAL* LPDIPROPCAL ;
TYPEDEF: DIPROPCAL* LPCDIPROPCAL ;
STRUCT: DIPROPGUIDANDPATH
    { diph DIPROPHEADER }
    { guidClass GUID }
    { wszPath WCHAR[260]   } ;
TYPEDEF: DIPROPGUIDANDPATH* LPDIPROPGUIDANDPATH ;
TYPEDEF: DIPROPGUIDANDPATH* LPCDIPROPGUIDANDPATH ;
STRUCT: DIPROPSTRING
    { diph DIPROPHEADER }
    { wsz WCHAR[260]   } ;
TYPEDEF: DIPROPSTRING* LPDIPROPSTRING ;
TYPEDEF: DIPROPSTRING* LPCDIPROPSTRING ;
STRUCT: CPOINT
    { lP LONG }
    { dwLog DWORD } ;
STRUCT: DIPROPCPOINTS
    { diph DIPROPHEADER }
    { dwCPointsNum DWORD }
    { cp CPOINT[8] } ;
TYPEDEF: DIPROPCPOINTS* LPDIPROPCPOINTS ;
TYPEDEF: DIPROPCPOINTS* LPCDIPROPCPOINTS ;
STRUCT: DIENVELOPE
    { dwSize DWORD }
    { dwAttackLevel DWORD }
    { dwAttackTime DWORD }
    { dwFadeLevel DWORD }
    { dwFadeTime DWORD } ;
TYPEDEF: DIENVELOPE* LPDIENVELOPE ;
TYPEDEF: DIENVELOPE* LPCDIENVELOPE ;
STRUCT: DIEFFECT
    { dwSize DWORD }
    { dwFlags DWORD }
    { dwDuration DWORD }
    { dwSamplePeriod DWORD }
    { dwGain DWORD }
    { dwTriggerButton DWORD }
    { dwTriggerRepeatInterval DWORD }
    { cAxes DWORD }
    { rgdwAxes LPDWORD }
    { rglDirection LPLONG }
    { lpEnvelope LPDIENVELOPE }
    { cbTypeSpecificParams DWORD }
    { lpvTypeSpecificParams LPVOID }
    { dwStartDelay DWORD } ;
TYPEDEF: DIEFFECT* LPDIEFFECT ;
TYPEDEF: DIEFFECT* LPCDIEFFECT ;
STRUCT: DIEFFECTINFOW
    { dwSize          DWORD      }
    { guid            GUID       }
    { dwEffType       DWORD      }
    { dwStaticParams  DWORD      }
    { dwDynamicParams DWORD      }
    { tszName         WCHAR[260] } ;
TYPEDEF: DIEFFECTINFOW* LPDIEFFECTINFOW ;
TYPEDEF: DIEFFECTINFOW* LPCDIEFFECTINFOW ;
STRUCT: DIEFFESCAPE
    { dwSize       DWORD  }
    { dwCommand    DWORD  }
    { lpvInBuffer  LPVOID }
    { cbInBuffer   DWORD  }
    { lpvOutBuffer LPVOID }
    { cbOutBuffer  DWORD  } ;
TYPEDEF: DIEFFESCAPE* LPDIEFFESCAPE ;
TYPEDEF: DIEFFESCAPE* LPCDIEFFESCAPE ;
STRUCT: DIFILEEFFECT
    { dwSize         DWORD       }
    { GuidEffect     GUID        }
    { lpDiEffect     LPCDIEFFECT }
    { szFriendlyName CHAR[260]   } ;
TYPEDEF: DIFILEEFFECT* LPDIFILEEFFECT ;
TYPEDEF: DIFILEEFFECT* LPCDIFILEEFFECT ;
STRUCT: DIDEVICEIMAGEINFOW
    { tszImagePath    WCHAR[260] }
    { dwFlags         DWORD      }
    { dwViewID        DWORD      }
    { rcOverlay       RECT       }
    { dwObjID         DWORD      }
    { dwcValidPts     DWORD      }
    { rgptCalloutLine POINT[5]   }
    { rcCalloutRect   RECT       }
    { dwTextAlign     DWORD      } ;
TYPEDEF: DIDEVICEIMAGEINFOW* LPDIDEVICEIMAGEINFOW ;
TYPEDEF: DIDEVICEIMAGEINFOW* LPCDIDEVICEIMAGEINFOW ;
STRUCT: DIDEVICEIMAGEINFOHEADERW
    { dwSize          DWORD }
    { dwSizeImageInfo DWORD }
    { dwcViews        DWORD }
    { dwcButtons      DWORD }
    { dwcAxes         DWORD }
    { dwcPOVs         DWORD }
    { dwBufferSize    DWORD }
    { dwBufferUsed    DWORD }
    { lprgImageInfoArray DIDEVICEIMAGEINFOW* } ;
TYPEDEF: DIDEVICEIMAGEINFOHEADERW* LPDIDEVICEIMAGEINFOHEADERW ;
TYPEDEF: DIDEVICEIMAGEINFOHEADERW* LPCDIDEVICEIMAGEINFOHEADERW ;

STRUCT: DIMOUSESTATE2
    { lX         LONG    }
    { lY         LONG    }
    { lZ         LONG    }
    { rgbButtons BYTE[8] } ;
TYPEDEF: DIMOUSESTATE2* LPDIMOUSESTATE2 ;
TYPEDEF: DIMOUSESTATE2* LPCDIMOUSESTATE2 ;

STRUCT: DIJOYSTATE2
    { lX         LONG      }
    { lY         LONG      }
    { lZ         LONG      }
    { lRx        LONG      }
    { lRy        LONG      }
    { lRz        LONG      }
    { rglSlider  LONG[2]   }
    { rgdwPOV    DWORD[4]  }
    { rgbButtons BYTE[128] }
    { lVX        LONG      }
    { lVY        LONG      }
    { lVZ        LONG      }
    { lVRx       LONG      }
    { lVRy       LONG      }
    { lVRz       LONG      }
    { rglVSlider LONG[2]   }
    { lAX        LONG      }
    { lAY        LONG      }
    { lAZ        LONG      }
    { lARx       LONG      }
    { lARy       LONG      }
    { lARz       LONG      }
    { rglASlider LONG[2]   }
    { lFX        LONG      }
    { lFY        LONG      }
    { lFZ        LONG      }
    { lFRx       LONG      }
    { lFRy       LONG      }
    { lFRz       LONG      }
    { rglFSlider LONG[2]   } ;
TYPEDEF: DIJOYSTATE2* LPDIJOYSTATE2 ;
TYPEDEF: DIJOYSTATE2* LPCDIJOYSTATE2 ;

CALLBACK: BOOL LPDIENUMDEVICESCALLBACKW (
    LPCDIDEVICEINSTANCEW lpddi,
    LPVOID pvRef
) ;
CALLBACK: BOOL LPDICONFIGUREDEVICESCALLBACK (
    IUnknown* lpDDSTarget,
    LPVOID pvRef
) ;
CALLBACK: BOOL LPDIENUMEFFECTSCALLBACKW (
    LPCDIEFFECTINFOW pdei,
    LPVOID pvRef
) ;
CALLBACK: BOOL LPDIENUMEFFECTSINFILECALLBACK (
    LPCDIFILEEFFECT lpDiFileEf,
    LPVOID pvRef
) ;
CALLBACK: BOOL LPDIENUMDEVICEOBJECTSCALLBACKW (
    LPCDIDEVICEOBJECTINSTANCEW lpddoi,
    LPVOID pvRef
) ;

COM-INTERFACE: IDirectInputEffect IUnknown "{E7E1F7C0-88D2-11D0-9AD0-00A0C9A06E35}"
    HRESULT Initialize ( HINSTANCE hinst, DWORD dwVersion, REFGUID rguid )
    HRESULT GetEffectGuid ( LPGUID pguid )
    HRESULT GetParameters ( LPDIEFFECT peff, DWORD dwFlags )
    HRESULT SetParameters ( LPCDIEFFECT peff, DWORD dwFlags )
    HRESULT Start ( DWORD dwIterations, DWORD dwFlags )
    HRESULT Stop ( )
    HRESULT GetEffectStatus ( LPDWORD pdwFlags )
    HRESULT Download ( )
    HRESULT Unload ( )
    HRESULT Escape ( LPDIEFFESCAPE pesc ) ;

CALLBACK: BOOL LPDIENUMCREATEDEFFECTOBJECTSCALLBACK (
    IDirectInputEffect* peff,
    LPVOID pvRef
) ;

COM-INTERFACE: IDirectInputDevice8W IUnknown "{54D41081-DC15-4833-A41B-748F73A38179}"
    HRESULT GetCapabilities ( LPDIDEVCAPS lpDIDeviceCaps )
    HRESULT EnumObjects ( LPDIENUMDEVICEOBJECTSCALLBACKW lpCallback, LPVOID pvRef, DWORD dwFlags )
    HRESULT GetProperty ( REFGUID rguidProp, LPDIPROPHEADER pdiph )
    HRESULT SetProperty ( REFGUID rguidProp, LPCDIPROPHEADER pdiph )
    HRESULT Acquire ( )
    HRESULT Unacquire ( )
    HRESULT GetDeviceState ( DWORD cbData, LPVOID lpvData )
    HRESULT GetDeviceData ( DWORD cbObjectData, LPDIDEVICEOBJECTDATA rgdod, LPDWORD pdwInOut, DWORD dwFlags )
    HRESULT SetDataFormat ( LPCDIDATAFORMAT lpdf )
    HRESULT SetEventNotification ( HANDLE hEvent )
    HRESULT SetCooperativeLevel ( HWND hwnd, DWORD dwFlags )
    HRESULT GetObjectInfo ( LPDIDEVICEOBJECTINSTANCEW rdidoi, DWORD dwObj, DWORD dwHow )
    HRESULT GetDeviceInfo ( LPDIDEVICEINSTANCEW pdidi )
    HRESULT RunControlPanel ( HWND hwndOwner, DWORD dwFlags )
    HRESULT Initialize ( HINSTANCE hinst, DWORD dwVersion, REFGUID rguid )
    HRESULT CreateEffect ( REFGUID rguid, LPCDIEFFECT lpeff, IDirectInputEffect** ppdeff, LPUNKNOWN punkOuter )
    HRESULT EnumEffects ( LPDIENUMEFFECTSCALLBACKW lpCallback, LPVOID pvRef, DWORD dwEffType )
    HRESULT GetEffectInfo ( LPDIEFFECTINFOW pdei, REFGUID rguid )
    HRESULT GetForceFeedbackState ( LPDWORD pdwOut )
    HRESULT SendForceFeedbackCommand ( DWORD dwFlags )
    HRESULT EnumCreatedEffectObjects ( LPDIENUMCREATEDEFFECTOBJECTSCALLBACK lpCallback, LPVOID pvRef, DWORD fl )
    HRESULT Escape ( LPDIEFFESCAPE pesc )
    HRESULT Poll ( )
    HRESULT SendDeviceData ( DWORD cbObjectData, LPCDIDEVICEOBJECTDATA rgdod, LPDWORD pdwInOut, DWORD fl )
    HRESULT EnumEffectsInFile ( LPCWSTR lpszFileName, LPDIENUMEFFECTSINFILECALLBACK lpCallback, LPVOID pvRef, DWORD dwFlags )
    HRESULT WriteEffectToFile ( LPCWSTR lpszFileName, DWORD dwEntries, LPDIFILEEFFECT rgDiFileEffect, DWORD dwFlags )
    HRESULT BuildActionMap ( LPDIACTIONFORMATW lpdiaf, LPCWSTR lpszUserName, DWORD dwFlags )
    HRESULT SetActionMap ( LPDIACTIONFORMATW lpdiActionFormat, LPCWSTR lpwszUserName, DWORD dwFlags )
    HRESULT GetImageInfo ( LPDIDEVICEIMAGEINFOHEADERW lpdiDeviceImageInfoHeader ) ;

CALLBACK: BOOL LPDIENUMDEVICESBYSEMANTICSCBW (
    LPCDIDEVICEINSTANCEW lpddi,
    IDirectInputDevice8W* lpdid,
    DWORD dwFlags,
    DWORD dwRemaining,
    LPVOID pvRef
) ;

COM-INTERFACE: IDirectInput8W IUnknown "{BF798031-483A-4DA2-AA99-5D64ED369700}"
    HRESULT CreateDevice ( REFGUID rguid, IDirectInputDevice8W** lplpDevice, LPUNKNOWN pUnkOuter )
    HRESULT EnumDevices ( DWORD dwDevType, LPDIENUMDEVICESCALLBACKW lpCallback, LPVOID pvRef, DWORD dwFlags )
    HRESULT GetDeviceStatus ( REFGUID rguidInstance )
    HRESULT RunControlPanel ( HWND hwndOwner, DWORD dwFlags )
    HRESULT Initialize ( HINSTANCE hinst, DWORD dwVersion )
    HRESULT FindDevice ( REFGUID rguidClass, LPCWSTR pwszName, LPGUID pguidInstance )
    HRESULT EnumDevicesBySemantics ( LPCWSTR pwszUserName, LPDIACTIONFORMATW lpdiActionFormat, LPDIENUMDEVICESBYSEMANTICSCBW lpCallback, LPVOID pvRef, DWORD dwFlags )
    HRESULT ConfigureDevices ( LPDICONFIGUREDEVICESCALLBACK lpdiCallback, LPDICONFIGUREDEVICESPARAMSW lpdiCDParams, DWORD dwFlags, LPVOID pvRefData ) ;

FUNCTION: HRESULT DirectInput8Create ( HINSTANCE hinst, DWORD dwVersion, REFIID riidtlf, LPVOID* ppvOut, LPUNKNOWN punkOuter ) ;

CONSTANT: DIRECTINPUT_VERSION 0x0800 ;

CONSTANT: DI8DEVCLASS_ALL             0 ;
CONSTANT: DI8DEVCLASS_DEVICE          1 ;
CONSTANT: DI8DEVCLASS_POINTER         2 ;
CONSTANT: DI8DEVCLASS_KEYBOARD        3 ;
CONSTANT: DI8DEVCLASS_GAMECTRL        4 ;

CONSTANT: DIEDFL_ALLDEVICES       0x00000000 ;
CONSTANT: DIEDFL_ATTACHEDONLY     0x00000001 ;
CONSTANT: DIEDFL_FORCEFEEDBACK    0x00000100 ;
CONSTANT: DIEDFL_INCLUDEALIASES   0x00010000 ;
CONSTANT: DIEDFL_INCLUDEPHANTOMS  0x00020000 ;
CONSTANT: DIEDFL_INCLUDEHIDDEN    0x00040000 ;

CONSTANT: DIENUM_STOP             0 ;
CONSTANT: DIENUM_CONTINUE         1 ;

CONSTANT: DIDF_ABSAXIS            1 ;
CONSTANT: DIDF_RELAXIS            2 ;

CONSTANT: DIDFT_ALL           0x00000000 ;

CONSTANT: DIDFT_RELAXIS       0x00000001 ;
CONSTANT: DIDFT_ABSAXIS       0x00000002 ;
CONSTANT: DIDFT_AXIS          0x00000003 ;

CONSTANT: DIDFT_PSHBUTTON     0x00000004 ;
CONSTANT: DIDFT_TGLBUTTON     0x00000008 ;
CONSTANT: DIDFT_BUTTON        0x0000000C ;

CONSTANT: DIDFT_POV           0x00000010 ;
CONSTANT: DIDFT_COLLECTION    0x00000040 ;
CONSTANT: DIDFT_NODATA        0x00000080 ;

CONSTANT: DIDFT_ANYINSTANCE   0x00FFFF00 ;
ALIAS: DIDFT_INSTANCEMASK  DIDFT_ANYINSTANCE ;
: DIDFT_MAKEINSTANCE ( n -- instance ) 8 shift                   ; inline
: DIDFT_GETTYPE      ( n -- type     ) 0xFF bitand            ; inline
: DIDFT_GETINSTANCE  ( n -- instance ) -8 shift 0xFFFF bitand ; inline
CONSTANT: DIDFT_FFACTUATOR        0x01000000 ;
CONSTANT: DIDFT_FFEFFECTTRIGGER   0x02000000 ;
CONSTANT: DIDFT_OUTPUT            0x10000000 ;
CONSTANT: DIDFT_VENDORDEFINED     0x04000000 ;
CONSTANT: DIDFT_ALIAS             0x08000000 ;
CONSTANT: DIDFT_OPTIONAL          0x80000000 ;

: DIDFT_ENUMCOLLECTION ( n -- instance ) 8 shift 0xFFFF bitand ; inline
CONSTANT: DIDFT_NOCOLLECTION      0x00FFFF00 ;

CONSTANT: DIDOI_FFACTUATOR        0x00000001 ;
CONSTANT: DIDOI_FFEFFECTTRIGGER   0x00000002 ;
CONSTANT: DIDOI_POLLED            0x00008000 ;
CONSTANT: DIDOI_ASPECTPOSITION    0x00000100 ;
CONSTANT: DIDOI_ASPECTVELOCITY    0x00000200 ;
CONSTANT: DIDOI_ASPECTACCEL       0x00000300 ;
CONSTANT: DIDOI_ASPECTFORCE       0x00000400 ;
CONSTANT: DIDOI_ASPECTMASK        0x00000F00 ;
CONSTANT: DIDOI_GUIDISUSAGE       0x00010000 ;

CONSTANT: DISCL_EXCLUSIVE     0x00000001 ;
CONSTANT: DISCL_NONEXCLUSIVE  0x00000002 ;
CONSTANT: DISCL_FOREGROUND    0x00000004 ;
CONSTANT: DISCL_BACKGROUND    0x00000008 ;
CONSTANT: DISCL_NOWINKEY      0x00000010 ;

CONSTANT: DIMOFS_X        0 ;
CONSTANT: DIMOFS_Y        4 ;
CONSTANT: DIMOFS_Z        8 ;
CONSTANT: DIMOFS_BUTTON0 12 ;
CONSTANT: DIMOFS_BUTTON1 13 ;
CONSTANT: DIMOFS_BUTTON2 14 ;
CONSTANT: DIMOFS_BUTTON3 15 ;
CONSTANT: DIMOFS_BUTTON4 16 ;
CONSTANT: DIMOFS_BUTTON5 17 ;
CONSTANT: DIMOFS_BUTTON6 18 ;
CONSTANT: DIMOFS_BUTTON7 19 ;

CONSTANT: DIK_ESCAPE          0x01 ;
CONSTANT: DIK_1               0x02 ;
CONSTANT: DIK_2               0x03 ;
CONSTANT: DIK_3               0x04 ;
CONSTANT: DIK_4               0x05 ;
CONSTANT: DIK_5               0x06 ;
CONSTANT: DIK_6               0x07 ;
CONSTANT: DIK_7               0x08 ;
CONSTANT: DIK_8               0x09 ;
CONSTANT: DIK_9               0x0A ;
CONSTANT: DIK_0               0x0B ;
CONSTANT: DIK_MINUS           0x0C ;
CONSTANT: DIK_EQUALS          0x0D ;
CONSTANT: DIK_BACK            0x0E ;
CONSTANT: DIK_TAB             0x0F ;
CONSTANT: DIK_Q               0x10 ;
CONSTANT: DIK_W               0x11 ;
CONSTANT: DIK_E               0x12 ;
CONSTANT: DIK_R               0x13 ;
CONSTANT: DIK_T               0x14 ;
CONSTANT: DIK_Y               0x15 ;
CONSTANT: DIK_U               0x16 ;
CONSTANT: DIK_I               0x17 ;
CONSTANT: DIK_O               0x18 ;
CONSTANT: DIK_P               0x19 ;
CONSTANT: DIK_LBRACKET        0x1A ;
CONSTANT: DIK_RBRACKET        0x1B ;
CONSTANT: DIK_RETURN          0x1C ;
CONSTANT: DIK_LCONTROL        0x1D ;
CONSTANT: DIK_A               0x1E ;
CONSTANT: DIK_S               0x1F ;
CONSTANT: DIK_D               0x20 ;
CONSTANT: DIK_F               0x21 ;
CONSTANT: DIK_G               0x22 ;
CONSTANT: DIK_H               0x23 ;
CONSTANT: DIK_J               0x24 ;
CONSTANT: DIK_K               0x25 ;
CONSTANT: DIK_L               0x26 ;
CONSTANT: DIK_SEMICOLON       0x27 ;
CONSTANT: DIK_APOSTROPHE      0x28 ;
CONSTANT: DIK_GRAVE           0x29 ;
CONSTANT: DIK_LSHIFT          0x2A ;
CONSTANT: DIK_BACKSLASH       0x2B ;
CONSTANT: DIK_Z               0x2C ;
CONSTANT: DIK_X               0x2D ;
CONSTANT: DIK_C               0x2E ;
CONSTANT: DIK_V               0x2F ;
CONSTANT: DIK_B               0x30 ;
CONSTANT: DIK_N               0x31 ;
CONSTANT: DIK_M               0x32 ;
CONSTANT: DIK_COMMA           0x33 ;
CONSTANT: DIK_PERIOD          0x34 ;
CONSTANT: DIK_SLASH           0x35 ;
CONSTANT: DIK_RSHIFT          0x36 ;
CONSTANT: DIK_MULTIPLY        0x37 ;
CONSTANT: DIK_LMENU           0x38 ;
CONSTANT: DIK_SPACE           0x39 ;
CONSTANT: DIK_CAPITAL         0x3A ;
CONSTANT: DIK_F1              0x3B ;
CONSTANT: DIK_F2              0x3C ;
CONSTANT: DIK_F3              0x3D ;
CONSTANT: DIK_F4              0x3E ;
CONSTANT: DIK_F5              0x3F ;
CONSTANT: DIK_F6              0x40 ;
CONSTANT: DIK_F7              0x41 ;
CONSTANT: DIK_F8              0x42 ;
CONSTANT: DIK_F9              0x43 ;
CONSTANT: DIK_F10             0x44 ;
CONSTANT: DIK_NUMLOCK         0x45 ;
CONSTANT: DIK_SCROLL          0x46 ;
CONSTANT: DIK_NUMPAD7         0x47 ;
CONSTANT: DIK_NUMPAD8         0x48 ;
CONSTANT: DIK_NUMPAD9         0x49 ;
CONSTANT: DIK_SUBTRACT        0x4A ;
CONSTANT: DIK_NUMPAD4         0x4B ;
CONSTANT: DIK_NUMPAD5         0x4C ;
CONSTANT: DIK_NUMPAD6         0x4D ;
CONSTANT: DIK_ADD             0x4E ;
CONSTANT: DIK_NUMPAD1         0x4F ;
CONSTANT: DIK_NUMPAD2         0x50 ;
CONSTANT: DIK_NUMPAD3         0x51 ;
CONSTANT: DIK_NUMPAD0         0x52 ;
CONSTANT: DIK_DECIMAL         0x53 ;
CONSTANT: DIK_OEM_102         0x56 ;
CONSTANT: DIK_F11             0x57 ;
CONSTANT: DIK_F12             0x58 ;
CONSTANT: DIK_F13             0x64 ;
CONSTANT: DIK_F14             0x65 ;
CONSTANT: DIK_F15             0x66 ;
CONSTANT: DIK_KANA            0x70 ;
CONSTANT: DIK_ABNT_C1         0x73 ;
CONSTANT: DIK_CONVERT         0x79 ;
CONSTANT: DIK_NOCONVERT       0x7B ;
CONSTANT: DIK_YEN             0x7D ;
CONSTANT: DIK_ABNT_C2         0x7E ;
CONSTANT: DIK_NUMPADEQUALS    0x8D ;
CONSTANT: DIK_PREVTRACK       0x90 ;
CONSTANT: DIK_AT              0x91 ;
CONSTANT: DIK_COLON           0x92 ;
CONSTANT: DIK_UNDERLINE       0x93 ;
CONSTANT: DIK_KANJI           0x94 ;
CONSTANT: DIK_STOP            0x95 ;
CONSTANT: DIK_AX              0x96 ;
CONSTANT: DIK_UNLABELED       0x97 ;
CONSTANT: DIK_NEXTTRACK       0x99 ;
CONSTANT: DIK_NUMPADENTER     0x9C ;
CONSTANT: DIK_RCONTROL        0x9D ;
CONSTANT: DIK_MUTE            0xA0 ;
CONSTANT: DIK_CALCULATOR      0xA1 ;
CONSTANT: DIK_PLAYPAUSE       0xA2 ;
CONSTANT: DIK_MEDIASTOP       0xA4 ;
CONSTANT: DIK_VOLUMEDOWN      0xAE ;
CONSTANT: DIK_VOLUMEUP        0xB0 ;
CONSTANT: DIK_WEBHOME         0xB2 ;
CONSTANT: DIK_NUMPADCOMMA     0xB3 ;
CONSTANT: DIK_DIVIDE          0xB5 ;
CONSTANT: DIK_SYSRQ           0xB7 ;
CONSTANT: DIK_RMENU           0xB8 ;
CONSTANT: DIK_PAUSE           0xC5 ;
CONSTANT: DIK_HOME            0xC7 ;
CONSTANT: DIK_UP              0xC8 ;
CONSTANT: DIK_PRIOR           0xC9 ;
CONSTANT: DIK_LEFT            0xCB ;
CONSTANT: DIK_RIGHT           0xCD ;
CONSTANT: DIK_END             0xCF ;
CONSTANT: DIK_DOWN            0xD0 ;
CONSTANT: DIK_NEXT            0xD1 ;
CONSTANT: DIK_INSERT          0xD2 ;
CONSTANT: DIK_DELETE          0xD3 ;
CONSTANT: DIK_LWIN            0xDB ;
CONSTANT: DIK_RWIN            0xDC ;
CONSTANT: DIK_APPS            0xDD ;
CONSTANT: DIK_POWER           0xDE ;
CONSTANT: DIK_SLEEP           0xDF ;
CONSTANT: DIK_WAKE            0xE3 ;
CONSTANT: DIK_WEBSEARCH       0xE5 ;
CONSTANT: DIK_WEBFAVORITES    0xE6 ;
CONSTANT: DIK_WEBREFRESH      0xE7 ;
CONSTANT: DIK_WEBSTOP         0xE8 ;
CONSTANT: DIK_WEBFORWARD      0xE9 ;
CONSTANT: DIK_WEBBACK         0xEA ;
CONSTANT: DIK_MYCOMPUTER      0xEB ;
CONSTANT: DIK_MAIL            0xEC ;
CONSTANT: DIK_MEDIASELECT     0xED ;

ALIAS: DIK_BACKSPACE       DIK_BACK ;
ALIAS: DIK_NUMPADSTAR      DIK_MULTIPLY ;
ALIAS: DIK_LALT            DIK_LMENU ;
ALIAS: DIK_CAPSLOCK        DIK_CAPITAL ;
ALIAS: DIK_NUMPADMINUS     DIK_SUBTRACT ;
ALIAS: DIK_NUMPADPLUS      DIK_ADD ;
ALIAS: DIK_NUMPADPERIOD    DIK_DECIMAL ;
ALIAS: DIK_NUMPADSLASH     DIK_DIVIDE ;
ALIAS: DIK_RALT            DIK_RMENU ;
ALIAS: DIK_UPARROW         DIK_UP ;
ALIAS: DIK_PGUP            DIK_PRIOR ;
ALIAS: DIK_LEFTARROW       DIK_LEFT ;
ALIAS: DIK_RIGHTARROW      DIK_RIGHT ;
ALIAS: DIK_DOWNARROW       DIK_DOWN ;
ALIAS: DIK_PGDN            DIK_NEXT ;

ALIAS: DIK_CIRCUMFLEX      DIK_PREVTRACK ;

CONSTANT: DI8DEVTYPE_DEVICE           0x11 ;
CONSTANT: DI8DEVTYPE_MOUSE            0x12 ;
CONSTANT: DI8DEVTYPE_KEYBOARD         0x13 ;
CONSTANT: DI8DEVTYPE_JOYSTICK         0x14 ;
CONSTANT: DI8DEVTYPE_GAMEPAD          0x15 ;
CONSTANT: DI8DEVTYPE_DRIVING          0x16 ;
CONSTANT: DI8DEVTYPE_FLIGHT           0x17 ;
CONSTANT: DI8DEVTYPE_1STPERSON        0x18 ;
CONSTANT: DI8DEVTYPE_DEVICECTRL       0x19 ;
CONSTANT: DI8DEVTYPE_SCREENPOINTER    0x1A ;
CONSTANT: DI8DEVTYPE_REMOTE           0x1B ;
CONSTANT: DI8DEVTYPE_SUPPLEMENTAL     0x1C ;

: GET_DIDEVICE_TYPE ( dwType -- type ) 0xFF bitand ; inline

CONSTANT: DIPROPRANGE_NOMIN       0x80000000 ;
CONSTANT: DIPROPRANGE_NOMAX       0x7FFFFFFF ;
CONSTANT: MAXCPOINTSNUM           8 ;

CONSTANT: DIPH_DEVICE             0 ;
CONSTANT: DIPH_BYOFFSET           1 ;
CONSTANT: DIPH_BYID               2 ;
CONSTANT: DIPH_BYUSAGE            3 ;

: DIMAKEUSAGEDWORD ( UsagePage Usage -- DWORD ) 16 shift bitor ; inline

: DIPROP_BUFFERSIZE ( -- alien ) 1 <alien> ; inline
: DIPROP_AXISMODE   ( -- alien ) 2 <alien> ; inline

CONSTANT: DIPROPAXISMODE_ABS      0 ;
CONSTANT: DIPROPAXISMODE_REL      1 ;

: DIPROP_GRANULARITY ( -- alien ) 3 <alien> ; inline
: DIPROP_RANGE       ( -- alien ) 4 <alien> ; inline
: DIPROP_DEADZONE    ( -- alien ) 5 <alien> ; inline
: DIPROP_SATURATION  ( -- alien ) 6 <alien> ; inline
: DIPROP_FFGAIN      ( -- alien ) 7 <alien> ; inline
: DIPROP_FFLOAD      ( -- alien ) 8 <alien> ; inline
: DIPROP_AUTOCENTER  ( -- alien ) 9 <alien> ; inline

CONSTANT: DIPROPAUTOCENTER_OFF    0 ;
CONSTANT: DIPROPAUTOCENTER_ON     1 ;

: DIPROP_CALIBRATIONMODE ( -- alien ) 10 <alien> ; inline

CONSTANT: DIPROPCALIBRATIONMODE_COOKED    0 ;
CONSTANT: DIPROPCALIBRATIONMODE_RAW       1 ;

: DIPROP_CALIBRATION ( -- alien )        11 <alien> ; inline
: DIPROP_GUIDANDPATH ( -- alien )        12 <alien> ; inline
: DIPROP_INSTANCENAME ( -- alien )       13 <alien> ; inline
: DIPROP_PRODUCTNAME ( -- alien )        14 <alien> ; inline
: DIPROP_JOYSTICKID ( -- alien )         15 <alien> ; inline
: DIPROP_GETPORTDISPLAYNAME ( -- alien ) 16 <alien> ; inline
: DIPROP_PHYSICALRANGE ( -- alien )      18 <alien> ; inline
: DIPROP_LOGICALRANGE ( -- alien )       19 <alien> ; inline
: DIPROP_KEYNAME ( -- alien )            20 <alien> ; inline
: DIPROP_CPOINTS ( -- alien )            21 <alien> ; inline
: DIPROP_APPDATA ( -- alien )            22 <alien> ; inline
: DIPROP_SCANCODE ( -- alien )           23 <alien> ; inline
: DIPROP_VIDPID ( -- alien )             24 <alien> ; inline
: DIPROP_USERNAME ( -- alien )           25 <alien> ; inline
: DIPROP_TYPENAME ( -- alien )           26 <alien> ; inline

CONSTANT: GUID_XAxis          guid: "{A36D02E0-C9F3-11CF-BFC7-444553540000}" ;
CONSTANT: GUID_YAxis          guid: "{A36D02E1-C9F3-11CF-BFC7-444553540000}" ;
CONSTANT: GUID_ZAxis          guid: "{A36D02E2-C9F3-11CF-BFC7-444553540000}" ;
CONSTANT: GUID_RxAxis         guid: "{A36D02F4-C9F3-11CF-BFC7-444553540000}" ;
CONSTANT: GUID_RyAxis         guid: "{A36D02F5-C9F3-11CF-BFC7-444553540000}" ;
CONSTANT: GUID_RzAxis         guid: "{A36D02E3-C9F3-11CF-BFC7-444553540000}" ;
CONSTANT: GUID_Slider         guid: "{A36D02E4-C9F3-11CF-BFC7-444553540000}" ;
CONSTANT: GUID_Button         guid: "{A36D02F0-C9F3-11CF-BFC7-444553540000}" ;
CONSTANT: GUID_Key            guid: "{55728220-D33C-11CF-BFC7-444553540000}" ;
CONSTANT: GUID_POV            guid: "{A36D02F2-C9F3-11CF-BFC7-444553540000}" ;
CONSTANT: GUID_Unknown        guid: "{A36D02F3-C9F3-11CF-BFC7-444553540000}" ;
CONSTANT: GUID_SysMouse       guid: "{6F1D2B60-D5A0-11CF-BFC7-444553540000}" ;
CONSTANT: GUID_SysKeyboard    guid: "{6F1D2B61-D5A0-11CF-BFC7-444553540000}" ;
CONSTANT: GUID_Joystick       guid: "{6F1D2B70-D5A0-11CF-BFC7-444553540000}" ;
CONSTANT: GUID_SysMouseEm     guid: "{6F1D2B80-D5A0-11CF-BFC7-444553540000}" ;
CONSTANT: GUID_SysMouseEm2    guid: "{6F1D2B81-D5A0-11CF-BFC7-444553540000}" ;
CONSTANT: GUID_SysKeyboardEm  guid: "{6F1D2B82-D5A0-11CF-BFC7-444553540000}" ;
CONSTANT: GUID_SysKeyboardEm2 guid: "{6F1D2B83-D5A0-11CF-BFC7-444553540000}" ;
