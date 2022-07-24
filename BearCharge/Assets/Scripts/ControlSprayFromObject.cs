using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.Interaction.Toolkit;

[RequireComponent(typeof(XRGrabInteractable))]

//https://github.com/Unity-Technologies/XR-Interaction-Toolkit-Examples/blob/master/VR/Assets/Scripts/BubbleGun.cs
public class ControlSprayFromObject : MonoBehaviour
{
    private XRGrabInteractable interactable;
    [SerializeField] private ParticleSystem spray = null;
    [SerializeField] private bool triggerDown;
    public float triggerDownTime = 0f;
    [SerializeField] private float maxTriggerDownTime = 8f;
    [SerializeField] private bool emptyCanister = false;

    public void Awake()
    {
        interactable = GetComponent<XRGrabInteractable>();
        spray = GetComponentInChildren<ParticleSystem>();
    }

    public void OnEnable()
    {
        interactable.activated.AddListener(TriggerPulled);
        interactable.deactivated.AddListener(TriggerReleased);
    }

    private void Update()
    {
        if (triggerDown)
        {
            Debug.Log("trigger is down");
            if(emptyCanister == false)
            {
                triggerDownTime += Time.deltaTime;
                if (triggerDownTime < maxTriggerDownTime)
                {
                    spray.Play();
                    Debug.Log("Particle system should be going");
                }
                else
                {
                    spray.Stop();
                    emptyCanister = true;

                    //show message that empty
                }
            }
                
            
        }
    }

    private void TriggerPulled(ActivateEventArgs arg0)
    {
        triggerDown = true;
    }

    private void TriggerReleased(DeactivateEventArgs arg0)
    {
        triggerDown = false;
        spray.Stop();
    }

    public void OnDisable()
    {
        interactable.activated.RemoveListener(TriggerPulled);
        interactable.deactivated.RemoveListener(TriggerReleased);
    }

    

   
   
}
