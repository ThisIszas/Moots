//
//  MinSubArrayLen.swift
//  LeetCode
//
//  Created by xiAo_Ju on 2018/12/26.
//  Copyright © 2018 伯驹 黄. All rights reserved.
//

import Foundation

/// https://leetcode-cn.com/explore/featured/card/all-about-array/233/sliding-window/971/
///输入: s = 7, nums = [2,3,1,2,4,3]
///输出: 2
///解释: 子数组 [4,3] 是该条件下的长度最小的连续子数组。
func minSubArrayLen(s: Int, nums: [Int]) -> Int {
    var sum = 0
    var j = 0
    var r = nums.count + 1
    for i in 0 ..< nums.count {
        sum += nums[i]
        while sum >= s {
            if i-j+1 < r {
                r = i-j+1
            }
            j += 1
            sum -= nums[j-1]
        }
    }
    return r > nums.count ? 0 : r
}

