/****************************************************************************
**
** Copyright (C) 2014 Alexander Rössler
** License: LGPL version 2.1
**
** This file is part of QtQuickVcp.
**
** All rights reserved. This program and the accompanying materials
** are made available under the terms of the GNU Lesser General Public License
** (LGPL) version 2.1 which accompanies this distribution, and is available at
** http://www.gnu.org/licenses/lgpl-2.1.html
**
** This library is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
** Lesser General Public License for more details.
**
** Contributors:
** Alexander Rössler @ The Cool Tool GmbH <mail DOT aroessler AT gmail DOT com>
**
****************************************************************************/
import QtQuick 2.1
import QtQuick.Controls 1.1
import Machinekit.HalRemote 1.0
import Machinekit.HalRemote.Controls 1.0

/*!
    \qmltype HalButton
    \inqmlmodule Machinekit.HalRemote.Controls
    \brief A push button with a text label.
    \ingroup halremotecontrols

    This component provides a button combined with a HAL pin. By default
    the type of the HAL pin is bit and the direction out.

    \qml
    HalButton {
        id: halButton
        name: "button"
    }
    \endqml

    \sa Button
*/

Button {
    /*! This property holds the name of the default HAL pin.
    */
    property string name: "button"

    /*! \qmlproperty HalPin halPin

        This property holds the default HAL pin.
    */
    property alias  halPin: pin

    id: main

    enabled: (pin.direction == HalPin.Out)

    HalPin {
        id: pin

        name: main.name
        type: HalPin.Bit
        direction: HalPin.Out
    }

    Binding { target: main; property: "pressed"; value: pin.value}
    Binding { target: pin; property: "value"; value: main.pressed}
}