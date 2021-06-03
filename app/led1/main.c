#include <led.h>
#include <timer.h>

int main(void) {
  int i_led = 1;

  // Wait for 5s before start
  delay_ms(5000);

  for (int i = 0; i < 10; i++) {
    // Turn the ith LED on for 1s
    led_on(i_led);
    delay_ms(1000);
    // Turn the ith LED off for 1s
    led_off(i_led);
    delay_ms(1000);
  }
}
