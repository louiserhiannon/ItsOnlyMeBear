using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.XR.Interaction.Toolkit;

public class ControlSpray : MonoBehaviour
{
    private ActionBasedController controller;
    //public ActivateSpray activateSpray;
    public ParticleSystem spray;

    public void Awake()
    {
        controller = GetComponent<ActionBasedController>();

        controller.activateAction.action.started += SprayOn;
        controller.activateAction.action.canceled += SprayOff;
    }

    private void SprayOff(InputAction.CallbackContext obj)
    {
        Debug.Log("SprayDeactivated");
        spray.Stop();
    }

    private void SprayOn(InputAction.CallbackContext obj)
    {
        //if (activateSpray.canisterStabilized)
        //{
        Debug.Log("Spray is Activated");
        spray.Play();
        //}
    }

}
