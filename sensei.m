#include <Foundation/Foundation.h>
#include <stdio.h>

SInt32 getIntProperty(io_registry_entry_t entry, CFStringRef property) {
  CFNumberRef num;
  SInt32 result;
  num =
      IORegistryEntryCreateCFProperty(entry, property, kCFAllocatorDefault, 0);
  CFNumberGetValue(num, kCFNumberSInt32Type, &result);
  CFRelease(num);
  return result;
}

Boolean getBoolProperty(io_registry_entry_t entry, CFStringRef property) {
  CFBooleanRef bool_prop;
  bool_prop =
      IORegistryEntryCreateCFProperty(entry, property, kCFAllocatorDefault, 0);
  Boolean result = CFBooleanGetValue(bool_prop);
  CFRelease(bool_prop);
  return result;
}

double getDoubleProperty(io_registry_entry_t entry, CFStringRef property) {
  CFNumberRef num;
  double result = 0;
  num =
      IORegistryEntryCreateCFProperty(entry, property, kCFAllocatorDefault, 0);
  if (num) {
    CFNumberGetValue(num, kCFNumberDoubleType, &result);
    CFRelease(num);
  }
  return result;
}

char *getStringProperty(io_registry_entry_t entry, CFStringRef property) {
  CFStringRef str;
  CFIndex size = 255;
  char *result = malloc((int)size * sizeof(char));
  result = "";
  str =
      IORegistryEntryCreateCFProperty(entry, property, kCFAllocatorDefault, 0);
  CFShow(str);
  if (str) {
    CFStringGetCString(str, result, size, kCFStringEncodingASCII);
    CFRelease(str);
  }
  return result;
}

void dumpBatteryInfo() {
  io_service_t batt = IOServiceGetMatchingService(
      kIOMasterPortDefault, IOServiceMatching("AppleSmartBattery"));

  if (!batt) {
    printf("No 'AppleSmartBattery' found!");
  } else {
    // Temperature : Double
    printf("temperature=%2.1f,",
           getDoubleProperty(batt, CFSTR("Temperature")) / 100);

    // IsCharging : Boolean
    printf("charging=%d,", getBoolProperty(batt, CFSTR("IsCharging")));

    // CycleCount / DesignCycleCount9C
    SInt32 cdesign = getIntProperty(batt, CFSTR("DesignCycleCount9C"));
    SInt32 ccount = getIntProperty(batt, CFSTR("CycleCount"));
    printf("remaining_cycles=%2.1f,", (100 - (ccount / (double)cdesign * 100)));

    // Capacity
    double nominal = getDoubleProperty(batt, CFSTR("NominalChargeCapacity"));
    double design = getDoubleProperty(batt, CFSTR("DesignCapacity"));
    double max = getDoubleProperty(batt, CFSTR("MaxCapacity"));
    double current = getDoubleProperty(batt, CFSTR("CurrentCapacity"));
    if (nominal) {
      // a) NominalChargeCapacity and DesignCapacity in mAH
      printf("remaining_capacity=%2.1f,", nominal / design * 100);
    } else if (design > 100) {
      // b) all in mAH
      printf("remaining_capacity=%2.1f,", max / design * 100);
    }
    printf("capacity=%2.1f\n", current / max * 100);
  }
}

int main() { dumpBatteryInfo(); }