//
//  CoursesRow.swift
//  SwiftUIMVVM
//
//  Created by GandhiMena on 20/10/19.
//  Copyright © 2019 gandhi. All rights reserved.
//

import SwiftUI

struct CoursesRow: View {

    @State var reposity: Fields

    var body: some View {
        Text(reposity.mes_hechos)
    }
}
